class UsersController < ApplicationController

before_action :get_user, only: [:edit, :update, :show]

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have registered successfully!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Sucessfully updated!"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end


  private

  def user_params
   params.require(:user).permit(:username, :password)
  end

  def get_user
    @user = current_user
    
  end

end