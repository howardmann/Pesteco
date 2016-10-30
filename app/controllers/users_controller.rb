class UsersController < ApplicationController
  def index
    @users = User.all.select{|user| !user.admin }
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @client = Client.find(params[:client_id])
    @user = User.new
  end

  def create
    @client = Client.find(params[:client_id])
    @user = User.create(user_params)
    @client.users << @user
    if @user.save
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
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :mobile, :client_id)
    end
end
