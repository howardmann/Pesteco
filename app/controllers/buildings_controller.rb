class BuildingsController < ApplicationController
  before_action :require_login
  before_action :require_admin, :except => [:show]

  def show
    building = Building.find(params[:id])

    if @current_user.admin || @current_user.buildings.include?(building)
      # Only admin and authorized user can see building page
      @building = building
    else
      flash[:error] = "You do not have rights to access that page"
      redirect_to client_path(@current_user.client)
    end
  end

  def new
    @client = Client.find(params[:client_id])
    @building = Building.new
  end

  def create
    @client = Client.find(params[:client_id])
    @building = Building.create(building_params)
    @client.buildings << @building
    if @building.save
      flash[:success] = "Building succesfully created"
      redirect_to client_path(@client)
    else
      render :new
    end
  end

  def edit
    @building = Building.find(params[:id])
  end

  def update
    @building = Building.find(params[:id])
    @building.update(building_params)
    if @building.save
      flash[:success] = "Building succesfully updated"
      redirect_to building_path(@building)
    else
      render :edit
    end
  end

  def destroy
    @building = Building.find(params[:id])
    @building.destroy
    flash[:success] = "Building removed"
    redirect_to root_path
  end

  private
    def building_params
      params.require(:building).permit(:name, :address, :reports, :client_id)
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
