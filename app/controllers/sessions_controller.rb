class SessionsController < ApplicationController

  def new
    
  end

  def create
    user = User.where(username: params[:username]).first
    #we could have done User.find to get a single record instead of an array.
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome. You are now logged in as #{user.username}"
      redirect_to root_path
    else
      flash.now[:error] = "Incorrect username or password."
      #use .now so it appears on the render or else do a redirect
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are now logged out. Goodbye."
    redirect_to root_path
  end


end

