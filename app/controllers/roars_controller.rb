class RoarsController < ApplicationController
 
  def index
    @roars = Roar.all include: :user
    @roar = Roar.new
  end

  def create
    @roar = Roar.new(params[:roar])
    @roar.user_id = current_user.id</p>

    if @roar.save
      redirect_to current_user
    else
      flash[:error] = "unable to save that gametime roar!"
      redirect_to current_user
    end
  end

end
