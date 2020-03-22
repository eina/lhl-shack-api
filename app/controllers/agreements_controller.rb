class AgreementsController < ApplicationController
  before_action :set_agreements, only: [:show, :update, :destroy]
    # GET /Agreements
    def index 
      @agreements = Agreement.all
      render json: @agreements
    end
  
    def show
      render json: @agreement
    end
  
    def create
      @agreement = Agreement.new(agreement_params)
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
        household_id = params[:household]        
        
        if household_id
          @agreement = Agreement.find_by(household_id: household_id)
          raise household_agreement.inspect
        else 
          @agreement = Agreement.find(params[:id])
        end
      end
  
      def agreement_params
        params.require(:agreement).permit(:form_values, :is_complete, :is_expired, :household_id)
      end
end
