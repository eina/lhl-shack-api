class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session
  before_action :set_users, only: [:show, :update, :destroy]

    # GET /Users
    def index 
      @users = User.all
      render json: @users
    end
  
    def show
      @household = Household.find_by(user_id: @user.id)      
      
      # if user has no household
      if @household.blank? 
        render json: @user        
        # render json: @user.errors, status: :forbidden
      else         
        # raise @user.households.inspect
        render :show, status: :created, location: @user
        # render json: output        
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
    end
  
    private 
      def set_users
        @user = User.find(params[:id])
      end
  
      def user_params
        params.require(:user).permit(:first_name, :last_name, :phone_number, :email, :password)
      end
end
