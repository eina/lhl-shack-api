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
      # raise @agreement.inspect
      if @agreement.save
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
        house_agreement = Agreement.find_by(household_id: params[:id], is_expired: false)
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
