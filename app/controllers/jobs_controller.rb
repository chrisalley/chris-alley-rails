class JobsController < ApplicationController  
  
  before_action :load_job, except: [:index, :new, :create]

  def index
    @jobs = policy_scope(Job.order("year_finished desc").page(params[:job]).per(100))
  end
  
  def new
    @job = Job.new
    authorize @job
  end

  def create
    @job = Job.new(job_params)
    authorize @job
    if @job.save
      redirect_to jobs_path, notice: "Successfully created job."
    else
      render :new
    end
  end
  
  def update
    if @job.update_attributes(job_params)
      redirect_to jobs_path, notice: "Successfully updated job."
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path, notice: "Successfully destroyed job."
  end
  
  private

  def job_params
    params.require(:job).permit(
      :name,
      :organisation,
      :month_started,
      :month_finished,
      :year_started,
      :year_finished,
      :content,
      :publish
    )
  end

  def load_job
    @job = Job.find_by url: params[:id]
    authorize @job
  end
  
end
