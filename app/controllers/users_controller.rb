class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
          session[:user_id] = @user.id
          redirect_to home_path
        else
          redirect_to new_user_path
        end
    end

    def home 
        @user = User.find_by(session[:user_id])
    end
    
    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
