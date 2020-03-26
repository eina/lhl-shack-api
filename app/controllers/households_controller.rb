class HouseholdsController < ApplicationController
  before_action :set_households, only: [:show, :update, :destroy]

  # GET /households
  def index 
    house_id = params[:house_id]

    if params.values_at(:house_id, :user_id).all?(&:present?)
      @households = Household.filter_household_by_house_and_user(params)
    elsif params.values_at(:house_id).all?(&:present?)
      @households = Household.filter_households_by_house(params)
    else
      @households = Household.all
    end
      render json: @households
  end

  def show    
    render json: @household

  end

  def create
    @household = Household.new(household_params)
    if @household.save
      render json: @household, status: :created
      # render :show, status: :created, location: @household
    else 
      render json: @household.errors, status: :unprocessable_entity
    end
  end

  def update
    if @household.update(household_params)
      render json: @household, status: :ok
      # render :show, status: :ok, location: @household
    else 
      render json: @household.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @household.destroy
  end

  private 
    def set_households
      @household = Household.find(params[:id])
    end

    def household_params
      params.require(:household).permit(:user_id, :house_id, :is_active, :start_date, :end_date, :housekeeping)
    end
end
