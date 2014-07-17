class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:userid] = user.id
      redirect_to rooturl, notice: "Logged in!"
    else
      flash[:error] = "Wrong Username or Password."
      redirect_to rooturl
    end
  end

  def destroy
    session[:userid] = nil
    redirect_to rooturl, notice: "You have been logged out!"
  end

end
