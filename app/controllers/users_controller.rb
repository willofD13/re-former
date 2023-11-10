class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
    end

    def create 
        #@user = User.new(username: params[:username],email: params[:email],password: params[:password])
        @user = User.new(user_params)

        if @user.save
            redirect_to new_user_path
        else
           render :new, status: :unprocessable_entity 
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to user_path(@user.id)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
    
        redirect_to root_path, status: :see_other
    end

        private
        def user_params
            params.require(:user).permit(:username,:email,:password)
        end

end
