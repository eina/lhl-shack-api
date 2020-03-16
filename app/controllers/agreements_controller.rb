class AgreementsController < ApplicationController
    # GET /Agreements
    def index 
      @agreements = Agreements.all
    end
  
    def show
    end
  
    def create
      @agreement = Agreement.new(agreement_params)
      if @Agreement.save
        render :show, status: :created, location: @agreement
      else 
        render json: @agreement.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @agreement.update(agreement_params)
        render :show, status: :ok, location: @agreement
      else 
        render json: @agreement.errors, status: unprocessable_entity
      end
    end
  
    def destroy
      @agreement.destroy
    end
  
    private 
      def set_agreements
        @agreement = agreement.find(params[:id])
      end
  
      def agreement_params
        params.require(:agreement).permit(:form_values, :is_complete, :is_expired)
      end
end
