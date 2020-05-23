class UsersController < ApplicationController

    before_action :authenticate_user!

    def index
        @book = Book.new
        @users = User.all
        @user = User.find(current_user.id)
    end

    def show
        @book = Book.new
        @books = Book.where(user_id:params[:id])
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
        if @user.id != current_user.id
            redirect_to user_path(current_user)
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = 'You have updated user successfully.'
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

end

private

def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
end