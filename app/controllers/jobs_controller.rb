class JobsController < ApplicationController  
  load_resource find_by: :url
  authorize_resource
  
  def index
    @jobs = Job.accessible_by(current_ability).order("year_finished desc").page(params[:job]).per(100)
  end

  def create 
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path, notice: "Successfully created job."
    else
      render 'new'
    end
  end
  
  def update
    if @job.update_attributes(job_params)
      redirect_to jobs_path, notice: "Successfully updated job."
    else
      render 'edit'
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path, notice: "Successfully destroyed job."
  end
  
  private

  def job_params
    params.require(:job).permit(:name, :organisation, :month_started, :month_finished, :year_started, :year_finished, :content, :publish)
  end
end
