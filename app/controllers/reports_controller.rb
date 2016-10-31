class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @building = Building.find(params[:building_id])
    @report = Report.new
  end

  def create
    @building = Building.find(params[:building_id])
    # TODO: replace with cloudinary upload of pdf files
    @report = Report.new(report_params)
    # First, check to see if the user has an attached an image/ pdf for uploading
    if params[:file]
      # Then call Cloudinary's upload method passing in the file as a paramater
      req = Cloudinary::Uploader.upload(params[:file], :public_id => "pesteco/#{@report.id}")
      # Using the public_id of the Cloudinary file allows us to use Cloudinary's powerful transformation methods
      @report.pdf = req['public_id']
    end
    # Save image and append to building
    @report.save
    @building.reports << @report

    if @report.save
      flash[:success] = "New report uploaded"
      redirect_to building_path(@building)
    else
      flash[:error] = "Upload unsuccessful"
      render :new
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])

    # Similar to create, check if file has been uploaded and if so upload to pdf
    if params[:file]
      req = Cloudinary.Uploader.upload(params[:file], :public_id => "pesteco/#{@report.id}")
      @report.pdf = req['public_id']
    end
    # We use update_attributes to not save straight away, similar to new vs. create
    @report.update_attributes(report_params)
    @report.save

    if @report.save
      flash[:success] = "Report updated"
      redirect_to building_path(@report.building)
    else
      flash[:error] = "Update unsuccesful"
      render :edit
    end
  end

  def destroy
    @building = Building.find(params[:building_id])
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to building_path(@building)
  end

  private
    def report_params
      params.require(:report).permit(:date, :pdf, :building_id)
    end
end
