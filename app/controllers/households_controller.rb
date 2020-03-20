class HouseholdsController < ApplicationController
  before_action :set_households, only: [:show, :update, :destroy]
      # GET /Households
      def index 
        @households = Households.all
      end
    
      def show
      end
    
      def create
        @household = Household.new(user_params)
        if @household.save
          render :show, status: :created, location: @household
        else 
          render json: @household.errors, status: :unprocessable_entity
        end
      end
    
      def update
        if @household.update(household_params)
          render :show, status: :ok, location: @household
        else 
          render json: @household.errors, status: unprocessable_entity
        end
      end
    
      def destroy
        @household.destroy
      end
    
      private 
        def set_households
          @household = household.find(params[:id])
        end
    
        def household_params
          # do we add in Foreign Keys? i.e. user_id and landlord_id here?
          params.require(:household).permit(:total_rent_amt, :total_security_deposit_amt, :address, :number_of_rooms, :number_of_bathrooms, :pet_friendly, :smoking_allowed, :start_date, :end_date, :user_id, :landlord_id)
        end
end
