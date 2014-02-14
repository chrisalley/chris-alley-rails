class QualificationsController < ApplicationController
  
  def index
    @qualifications = Qualification.order("year_completed desc").page(params[:qualification]).per(100)
  end
  
  def show
    @qualification = Qualification.find_by_url(params[:id])
  end
  
  def new
    @qualification = Qualification.new
  end
  
  def edit
    @qualification = Qualification.find_by_url(params[:id])
  end

  def create 
    @qualification = Qualification.new(qualification_params)
    if @qualification.save
      redirect_to qualifications_path, notice: "Successfully created qualification."
    else
      render :new
    end
  end
  
  def update
    @qualification = Qualification.find_by_url(params[:id])
    if @qualification.update_attributes(qualification_params)
      redirect_to qualifications_path, notice: "Successfully updated qualification."
    else
      render :edit
    end
  end

  def destroy
    @qualification = Qualification.find_by_url(params[:id])
    if @qualification.destroy
      redirect_to qualifications_path, notice: "Successfully destroyed qualification."
    end
  end
  
  private

  def qualification_params
    params.require(:qualification).permit(:name, :education_provider, :year_completed, :content, :certificate, :certificate_cache, :publish)
  end
  
end
