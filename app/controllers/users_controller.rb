class UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token
  # protect_from_forgery with: :null_session
  before_action :set_users, only: [:show, :update, :destroy]

    # GET /Users
    def index 
      email = params[:email]
      household = params[:household_id]      

      if email.blank?
        @users = User.all
      else
        @users = User.where(email: email)
      end
      render json: @users
    end
  
    def show
      # joining table between users and household
      user_household = Renter.find_by(user_id: @user.id)
      # raise user_household.inspect
      if user_household.blank?
        render json: @user
      else        
        household = Household.find(user_household.household_id)
        house = House.find(household.house_id)
        landlord = Landlord.find(house.landlord_id)      
        @output = { user: @user, household: household.id, house: house.id, landlord: landlord.id }    
        render :show, status: :ok, location: @user
      end
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else 
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @user.update(user_params)
        render json: @user, status: :ok
      else 
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @user.destroy
      render json: @user, status: :ok
    end
  
    private 
      def set_users
        @user = User.find(params[:id])
      end
  
      def user_params
        params.require(:user).permit(:first_name, :last_name, :phone_number, :email, :password)
      end
end
