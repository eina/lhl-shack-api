class UsersController < ApplicationController
  before_action :set_users, only: [:show, :update, :destroy]

    # GET /Users
    def index 
      @users = User.all
      render json: @users
    end
  
    def show
      render json: @user
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
        render json: @user.errors, status: unprocessable_entity
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
