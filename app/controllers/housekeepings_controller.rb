class HousekeepingsController < ApplicationController
    before_action :housekeepings, only: [:show, :update, :destroy]

  # GET /landlords
  def index 
    @housekeepings = Landlord.all
    render json: @housekeepings
  end

  def show
    render json: @housekeeping
  end

  def create
    @housekeeping = Housekeeping.new(housekeeping_params)
    if @housekeeping.save
      render json: @housekeeping, status: :created      
    else 
      render json: @housekeeping.errors, status: :unprocessable_entity
    end
  end

  def update
    if @housekeeping.update(housekeeping_params)
      render json: @housekeeping, status: :ok      
    else 
      render json: @housekeeping.errors, status: unprocessable_entity
    end
  end

  def destroy
    @housekeeping.destroy
  end

  private 
    def set_housekeepings
      @housekeeping = Housekeeping.find(params[:id])
    end

    def housekeeping_params
      params.require(:housekeeping).permit(:housekeeping_values, :house_id)
    end
end
