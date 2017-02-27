class IncidentsController < ApplicationController
  before_action :require_login

  def new
    @building = Building.find(params[:building_id])
    @incident = Incident.new
  end

  def create
    @building = Building.find(params[:building_id])
    @incident = Incident.create(incident_params)
    @building.incidents << @incident
    @current_user.incidents << @incident
    if @incident.save
      flash[:success] = "Incident succesfully added"
      redirect_to building_path(@building)
    else
      render :new
    end
  end

  def show
    @building = Building.find(params[:building_id])
    @incident = Incident.find(params[:id])
  end

  def edit
    @building = Building.find(params[:building_id])
    @incident = Incident.find(params[:id])
  end

  def update
    @building = Building.find(params[:building_id])
    @incident = Incident.find(params[:id])
    @incident.update(incident_params)
    if @incident.save
      flash[:success] = "Incident succesfully updated"
      redirect_to building_path(@building)
    else
      render :edit
    end
  end

  def destroy
    @building = Building.find(params[:building_id])
    @incident = Incident.find(params[:id])
    @incident.destroy
    flash[:success] = "Incident removed"
    redirect_to building_path(@building)
  end

  private
    def incident_params
      params.require(:incident).permit(:date_report, :description, :date_respond, :response, :technician, :building_id, :user_id)
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
