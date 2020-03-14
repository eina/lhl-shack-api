class LandlordsController < ApplicationController
  before_action :set_landlords, only: [:show, :update, :destroy]

  # GET /landlords
  def index 
    @landlords = Landlord.all
  end

  def show
  end

  def create
    @landlord = Landlord.new(landlord_params)
    if @landlord.save
      render :show, status: :created, location: @landlord
    else 
      render json: @landlord.errors, status: :unprocessable_entity
    end
  end

  def update
    if @landlord.update(landlord_params)
      render :show, status: :ok, location: @landlord
    else 
      render json: @todo.errors, status: unprocessable_entity
    end
  end

  def destroy
    @landlord.destroy
  end

  private 
    def set_landlords
      @landlord = Landlord.find(params[:id])
    end

    def landlord_params
      params.require(:landlord).permit(:first_name, :last_name, :phone_number, :email, :address)
    end
end
