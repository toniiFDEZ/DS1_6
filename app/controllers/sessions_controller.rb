class SessionsController < ApplicationController
  def new
  end
  def create
    user = Usuario.find_by_email(params[:email])
    if user
      session[:id] = user.id
      redirect_to productos_url, notice: 'Logged in!'
    else
      render :new
    end
  end
  def destroy
    session[:id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end