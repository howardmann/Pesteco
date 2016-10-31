class ClientsController < ApplicationController
  before_action :require_login
  before_action :require_admin, :except => [:show]

  def index
    @clients = Client.all
  end

  def show
    client = Client.find(params[:id])

    if @current_user.admin || @current_user.client == client
      # Only admin and authorized user can see client page
      @client = client
    else
      flash[:error] = "You do not have rights to access this page"
      redirect_to root_path
    end
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.create(client_params)
    if @client.save
      flash[:success] = 'Client successfully created'
      redirect_to client_path(@client)
    else
      render :new
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    @client.update(client_params)
    if @client.save
      flash[:success] = 'Client successfully updated'
      redirect_to client_path(@client)
    else
      render :edit
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    flash[:success] = 'Client account deleted'
    redirect_to clients_path
  end

  private
    def client_params
      params.require(:client).permit(:name, :address)
    end

    def require_login
      unless @current_user
        flash[:error] = "You do not have rights to access this page"
        redirect_to root_path
      end
    end

    def require_admin
      unless @current_user && @current_user.admin
        flash[:error] = "You do not have rights to access this page"
        redirect_to root_path
      end
    end
end
