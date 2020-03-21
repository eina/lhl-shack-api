class HousesController < ApplicationController
  before_action :set_houses, only: [:show, :update, :destroy]
      # GET /Houses
      def index 
        @houses = House.all
        render json: @houses
      end
    
      def show
        render json: @house
      end
    
      def create
        @house = House.new(user_params)
        if @house.save
          render json: @house, status: :created
        else 
          render json: @house.errors, status: :unprocessable_entity
        end
      end
    
      def update
        if @house.update(house_params)
          render json: @house, status: :ok
        else 
          render json: @house.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        @house.destroy
      end
    
      private 
        def set_houses
          @house = House.find(params[:id])
        end
    
        def house_params
          params.require(:house).permit(:total_rent_amt, :total_security_deposit_amt, :address, :number_of_rooms, :number_of_bathrooms, :pet_friendly, :smoking_allowed, :start_date, :end_date, :user_id, :landlord_id)
        end
end
