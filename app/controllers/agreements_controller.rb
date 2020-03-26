require 'aws-sdk-s3'

class AgreementsController < ApplicationController
  before_action :set_agreements, only: [:show, :update, :destroy]
    # GET /Agreements
    def index        
      household_id = params[:household_id]      
      if household_id.blank?
        @agreements = Agreement.all
      else 
        # GET /api/agreements?household_id=params[:household_id]
        @agreements = Agreement.find_by(household_id: household_id)
      end
      render json: @agreements.as_json(except: [:html_string])      
    end
  
    def show      
      render json: @agreement.as_json(except: [:html_string])
    end
  
    def create
      is_html_string =  agreement_params[:html_string].blank?      
      @agreement = Agreement.new(agreement_params)

      # initialize s3      
      if @agreement.save
        # if html string isn't blank
        if (!is_html_string)
          s3 = Aws::S3::Resource.new(region:'us-west-2')
          
          # generate pdf          
          pdf = WickedPdf.new.pdf_from_string(agreement_params[:html_string])
          timestamp = Time.now.utc.strftime("%Y%m%d%H%M%S")
          filename = "#{params[:household_id]}/agreements/agreement-#{timestamp}.pdf"
          # can i do "household1/filename" hmmm 
          link = "#{ENV['CLOUDFRONT_URL']}/#{filename}"                  

          # upload to S3
          obj = s3.bucket(ENV['S3_BUCKET']).object(filename)
          obj.put(body: pdf)

          if (obj.exists? == true)
            # should probably save this link to the model lol
            render json: { link: link }, status: :created
          else 
            render json: @agreement.as_json(except: [:html_string]), status: :created
          end
        else 
          render json: @agreement.as_json(except: [:html_string]), status: :created
        end
                                          
        # render :show, status: :created, location: @agreement
      else 
        render json: @agreement.errors, status: :unprocessable_entity
      end
    end
  
    def update
      is_html_string =  agreement_params[:html_string].blank?    
      if @agreement.update(agreement_params)
        # if html string isn't blank
        if (!is_html_string)
          s3 = Aws::S3::Resource.new(region:'us-west-2')
          
          # generate pdf          
          pdf = WickedPdf.new.pdf_from_string(agreement_params[:html_string])
          timestamp = Time.now.utc.strftime("%Y%m%d%H%M%S")
          filename = "#{params[:household_id]}/agreements/agreement-#{timestamp}.pdf"
          
          link = "#{ENV['CLOUDFRONT_URL']}/#{filename}"                  

          # upload to S3
          obj = s3.bucket(ENV['S3_BUCKET']).object(filename)
          obj.put(body: pdf)

          if (obj.exists? == true)
            # should probably save this link to the model lol
            render json: { link: link }, status: :created
          else 
            render json: @agreement.as_json(except: [:html_string]), status: :created
          end
        end
        render json: @agreement.as_json(except: [:html_string]), status: :created

      else 
        render json: @agreement.errors, status: unprocessable_entity
      end
    end
  
    def destroy
      @agreement.destroy
      render json: @agreement.as_json(except: [:html_string]), status: :ok
    end
  
    private 
      def set_agreements                        
        house_agreement = Agreement.where(household_id: params[:id])
        if house_agreement.blank?
          @agreement = Agreement.find(params[:id])
        else
          # raise house_agreement.inspect
          @agreement = Agreement.find_by(household_id: params[:id])
        end
      end
  
      def agreement_params
        params.require(:agreement).permit(:household_id, :form_values, :is_complete, :is_expired, :html_string)
      end
end
