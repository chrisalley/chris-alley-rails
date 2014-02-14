class JobsController < ApplicationController  
  
  def index
    @jobs = Job.order("year_finished desc").page(params[:job]).per(100)
  end

  def show
    @job = Job.find_by_url(params[:id])
  end
  
  def new
    @job = Job.new
  end
  
  def edit
    @job = Job.find_by_url(params[:id])
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path, notice: "Successfully created job."
    else
      render :new
    end
  end
  
  def update
    @job = Job.find_by_url(params[:id])
    if @job.update_attributes(job_params)
      redirect_to jobs_path, notice: "Successfully updated job."
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find_by_url(params[:id])
    if @job.destroy
      redirect_to jobs_path, notice: "Successfully destroyed job."
    end
  end
  
  private

  def job_params
    params.require(:job).permit(:name, :organisation, :month_started, :month_finished, :year_started, :year_finished, :content, :publish)
  end
  
end
