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
      render json: @agreements      
    end
  
    def show      
      render json: @agreement
    end
  
    def create
      @agreement = Agreement.new(agreement_params)

      # initialize s3      
      # s3 = Aws::S3::Resource.new(region:'us-west-2')
      
      if @agreement.save
        # generate pdf        
        # pdf = WickedPdf.new.pdf_from_string('<h1>Hello There!</h1>')
        # generate a unique file name probably
        filename = 'test.pdf'
        
        #create in stream
        # send_data pdf, filename: filename
        
        # upload to S3
        # obj = s3.bucket(ENV['S3_BUCKET']).object(filename)
        # obj.put(body: pdf)                

        render json: @agreement, status: :created
        # render :show, status: :created, location: @agreement
      else 
        render json: @agreement.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @agreement.update(agreement_params)
        # render :show, status: :ok, location: @agreement
        render json: @agreement, status: :ok
      else 
        render json: @agreement.errors, status: unprocessable_entity
      end
    end
  
    def destroy
      @agreement.destroy
      render json: @agreement, status: :ok
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
