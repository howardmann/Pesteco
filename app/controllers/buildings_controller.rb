class BuildingsController < ApplicationController
  def index
    @buildings = Building.all
  end

  def show
    @building = Building.find(params[:id])
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
end
