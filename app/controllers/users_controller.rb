class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def new
    if current_user
      redirect_to buddies_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Thanks for your signing up. Now Roar!"
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @roar = Roar.new

    @relationship = Relationship.where(
      follower_id: current_user.id,
      followed_id: @user.id
      ).first_or_initialize if current_user
  end
  
  def buddies
    if current_user
      @roar = Roar.new
      buddies_ids = current_user.followeds.map(&:id).push(current_user.id)
      @roars = Roar.find_all_by_user_id buddies_ids
    else
      redirect_to root_url
    end
  end

end
