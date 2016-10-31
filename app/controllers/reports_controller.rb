class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def show
  end

  def new
    @building = Building.find(params[:building_id])
    @report = Report.new
  end

  def create
    @building = Building.find(params[:building_id])
    # TODO: replace with cloudinary upload of pdf files
    @report = Report.create(report_params)
    @building.reports << @report
    if @report.save
      redirect_to building_path(@building)
    else
      render :new
    end
  end

  def edit
  end

  private
    def report_params
      params.require(:report).permit(:date, :pdf, :building_id)
    end
end
