class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to @user, notice: "Thanks for your signing up! Banter away [:"
    else
      redirect_to 'new'
    end
  end

  def show
    @user = User.new(params[:id])
  end
  
end
