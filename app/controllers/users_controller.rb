class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have now signed up! Login below to begin creating milestones..."
      redirect_to :root
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

protected

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end