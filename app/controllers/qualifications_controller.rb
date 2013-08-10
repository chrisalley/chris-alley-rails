class QualificationsController < ApplicationController
  load_resource :find_by => :url
  authorize_resource
  
  def index
    @qualifications = Qualification.accessible_by(current_ability).order("year_completed desc").page(params[:qualification]).per(100)
  end

  def create 
    @qualification = Qualification.new(qualification_params)
    if @qualification.save
      redirect_to qualifications_path, :notice => "Successfully created qualification."
    else
      render 'new'
    end
  end
  
  def update
    if @qualification.update_attributes(qualification_params)
      redirect_to qualifications_path, :notice => "Successfully updated qualification."
    else
      render 'edit'
    end
  end

  def destroy
    @qualification.destroy
    redirect_to qualifications_path, :notice => "Successfully destroyed qualification."
  end
  
private

  def qualification_params
    params.require(:qualification).permit(:name, :education_provider, :year_completed, :content, :certificate, :certificate_cache, :publish)
  end
end
