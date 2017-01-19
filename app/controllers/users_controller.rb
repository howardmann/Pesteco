class UsersController < ApplicationController
  before_action :require_login

  def show
    user = User.find(params[:id])

    if @current_user.admin || @current_user == user || user.client == @current_user.client && @current_user.client_admin
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

    # APPEND SELECTED BUILDINGS TO USER
    # Capture array of building ids selected and reject any blanks
    building_ids = params[:user][:building_ids].reject{ |id| id.empty? }
    building_ids.each do |id|
      @user.buildings << Building.find(id)
    end

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
    user = User.find(params[:id])
    if @current_user.admin || @current_user == user || user.client == @current_user.client && @current_user.client_admin
      @user = user
    else
      flash[:error] = "You do not have rights to access that user page"
      redirect_to user_path(@current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    # CHANGE BUILDING ACCESS
    if @current_user.admin || @current_user.client_admin
      building_ids = params[:user][:building_ids].reject{ |id| id.empty? }
      @user.buildings.destroy_all
      building_ids.each do |id|
        @user.buildings << Building.find(id)
      end
    end

    if @user.save
      flash[:success] = 'User successfully updated'
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
      params.require(:user).permit(:email, :name, :mobile, :password, :password_confirmation, :client_id, :client_admin)
    end

    def require_login
      unless @current_user
        flash[:error] = "You do not have rights to access this page"
        redirect_to root_path
      end
    end
end
