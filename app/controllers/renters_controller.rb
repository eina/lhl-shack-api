class RentersController < ApplicationController
  before_action :set_renter, only: [:show, :edit, :update, :destroy]

  # GET /renters
  # GET /renters.json
  def index
    if params.values_at(:household_id).all?(&:present?)
      @renters = Renter.filter_by_household(params)
    else 
      @renters = Renter.all
    end
    render json: @renters
  end

  # GET /renters/1
  # GET /renters/1.json
  def show
    render json: @renter
  end

  # GET /renters/new
  def new
    @renter = Renter.new
  end

  # POST /renters
  # POST /renters.json
  def create
    @renter = Renter.new(renter_params)

    respond_to do |format|
      if @renter.save
        render json: @renter, status: :created        
      else
        render json: @renter.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /renters/1
  # PATCH/PUT /renters/1.json
  def update
    respond_to do |format|
      if @renter.update(renter_params)
        render json: @renter, status: :created
      else
        render json: @renter.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /renters/1
  # DELETE /renters/1.json
  def destroy
    @renter.destroy
    render json: @renter, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_renter
      @renter = Renter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def renter_params
      params.require(:renter).permit(:user_id, :household_id)
    end
end
