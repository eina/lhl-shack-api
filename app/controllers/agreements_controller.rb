require 'aws-sdk-s3'

class AgreementsController < ApplicationController
  before_action :set_agreements, only: [:show, :update, :destroy]
    # GET /Agreements
    def index 
      @agreements = Agreement.all
      render json: @agreements
    end
  
    def show
    end
  
    def create
      @agreement = Agreement.new(agreement_params)

      # initialize s3      
      s3 = Aws::S3::Resource.new(region:'us-west-2')
      
      if @agreement.save
        # generate pdf        
        pdf = WickedPdf.new.pdf_from_string('<h1>Hello There!</h1>')
        # generate a unique file name probably
        filename = 'test.pdf'
        
        #create in stream
        send_data pdf, filename: filename
        
        # upload to S3
        obj = s3.bucket(ENV['S3_BUCKET']).object(filename)
        obj.put(body: pdf)                

        # render json: @agreement, status: :created
        # render :show, status: :created, location: @agreement
      else 
        render json: @agreement.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @agreement.update(agreement_params)
        render json: @agreement, status: :ok
        # render :show, status: :ok, location: @agreement
      else 
        render json: @agreement.errors, status: unprocessable_entity
      end
    end
  
    def destroy
      @agreement.destroy
    end    
  
    private 
      def set_agreements
        @agreement = Agreement.find(params[:id])
      end
  
      def agreement_params
        params.require(:agreement).permit(:form_values, :is_complete, :is_expired, :household_id)
      end
end
