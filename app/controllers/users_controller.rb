class UsersController < ApplicationController
  before_action :require_login

  def show
    user = User.find(params[:id])

    if @current_user.admin || @current_user == user
      @user = user
    else
      flash[:error] = "You do not have rights to access that user page"
      redirect_to user_path(@current_user)
    end
  end

  def new
    @client = Client.find(params[:client_id])
    @user = User.new
  end

  def create
    @client = Client.find(params[:client_id])

    @user = User.new(user_params)
    token = SecureRandom.urlsafe_base64(8)
    @user.password = token
    @user.password_confirmation = token

    @client.users << @user

    if @user.save
      # Action Mailer to send email upon sign up
      @user.send_password_welcome
      flash[:success] = "New user added to #{@client.name}"
      redirect_to client_path(@client)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    if @current_user && @current_user.admin
      redirect_to clients_path
    else
      redirect_to root_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :mobile, :client_id)
    end

    def require_login
      unless @current_user
        flash[:error] = "You do not have rights to access this page"
        redirect_to root_path
      end
    end
end
