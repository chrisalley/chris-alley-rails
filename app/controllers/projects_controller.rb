class ProjectsController < ApplicationController
  before_action :load_project, except: [:index, :new, :create]

  def index
    @projects = policy_scope(Project.order("priority desc").page(params[:project]).per(100))
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    authorize @project
    if @project.save
      redirect_to projects_path, notice: "Successfully created project."
    else
      render :new
    end
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to projects_path, notice: "Successfully updated project."
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: "Successfully destroyed project."
  end

  private

  def project_params
    params.require(:project).permit(
      :name,
      :content,
      :screenshot,
      :screenshot_cache,
      :website_url,
      :download_url,
      :source_code_url,
      :priority,
      :publish
    )
  end

  def load_project
    @project = Project.find_by url: params[:id]
    authorize @project
  end
end
