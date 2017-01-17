class GroupsController < ApplicationController
  before_action :require_login
  before_action :require_admin, :except => [:index, :show]

  def index
    @client = Client.find(params[:client_id])
  end

  def show
    @client = Client.find(params[:client_id])
    @group = Group.find(params[:id])
  end

  def new
    @client = Client.find(params[:client_id])
    @group = Group.new
  end

  def create
    @client = Client.find(params[:client_id])
    @group = Group.create(group_params)
    @client.groups << @group
    if @group.save
      flash[:success] = "Group succesfully created"
      redirect_to client_path(@client)
    else
      render :new
    end

  end

  def edit
    @client = Client.find(params[:client_id])
    @group = Group.find(params[:id])
  end

  def update
    @client = Client.find(params[:client_id])
    @group = Group.find(params[:id])
    @group.update(group_params)
    if @group.save
      flash[:success] = "Group succesfully updated"
      redirect_to client_path(@client)
    else
      render :edit
    end
  end

  def destroy
    @client = Client.find(params[:client_id])
    @group = Group.find(params[:id])
    @group.destroy
    flash[:success] = "Group removed"
    redirect_to client_groups_path(@client)
  end

  private
    def group_params
      params.require(:group).permit(:name, :client_id)
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
