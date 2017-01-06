class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(:email => params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Succesful login, welcome back"
      if user.admin
        redirect_to clients_path
      elsif user.client_admin
        redirect_to client_path(user.client)
      else
        redirect_to user_path(user)
      end
    else
      flash.now[:error] = "Incorrect email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out"
    redirect_to root_path
  end
end
