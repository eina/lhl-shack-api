class LandlordsController < ApplicationController
  before_action :set_landlords, only: [:show, :update, :destroy]

  # GET /landlords
  def index 
    @landlords = Landlord.all
    render json: @landlords
  end

  def show
    render json: @landlord
  end

  def create
    @landlord = Landlord.new(landlord_params)
    if @landlord.save
      render json: @landlord, status: :created
      # render :show, status: :created, location: @landlord
    else 
      render json: @landlord.errors, status: :unprocessable_entity
    end
  end

  def update
    if @landlord.update(landlord_params)
      render json: @landlord, status: :ok
      # render :show, status: :ok, location: @landlord
    else 
      render json: @landlord.errors, status: unprocessable_entity
    end
  end

  def destroy
    @landlord.destroy
    render json: @split_bills, status: :ok
  end

  private 
    def set_landlords
      @landlord = Landlord.find(params[:id])
    end

    def landlord_params
      params.require(:landlord).permit(:first_name, :last_name, :phone_number, :email, :address, :company)
    end
end
