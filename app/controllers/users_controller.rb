class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new(user_params)

    if @user.save
      log_in @user
      redirect_to events_path
    else
      render 'errors'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Management Science events!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end