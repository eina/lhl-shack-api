class UsersController < ApplicationController
    # GET /Users
    def index 
      @users = User.all
    end
  
    def show
    end
  
    def create
      @luserr = User.new(user_params)
      if @user.save
        render :show, status: :created, location: @user
      else 
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @user.update(user_params)
        render :show, status: :ok, location: @user
      else 
        render json: @todo.errors, status: unprocessable_entity
      end
    end
  
    def destroy
      @user.destroy
    end
  
    private 
      def set_users
        @user = user.find(params[:id])
      end
  
      def user_params
        params.require(:user).permit(:first_name, :last_name, :phone_number, :email, :password)
      end
end
