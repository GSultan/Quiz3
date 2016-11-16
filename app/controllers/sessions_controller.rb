class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email params[:email].downcase
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to ideas_path, notice: 'Welcome Back!'
    else
      flash.now[:alert] = 'Wrong credentials. Try again.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to ideas_path, notice: 'Goodbye!'
  end

end
