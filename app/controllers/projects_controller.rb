class ProjectsController < ApplicationController
  
  def index
    @projects = Project.order("priority desc").page(params[:project]).per(100)
  end

  def show
    @project = Project.find_by_url(params[:id])
  end
  
  def new
    @project = Project.new
  end
  
  def edit
    @project = Project.find_by_url(params[:id])
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, notice: "Successfully created project."
    else
      render :new
    end
  end
  
  def update
    @project = Project.find_by_url(params[:id])
    if @project.update_attributes(project_params)
      redirect_to projects_path, notice: "Successfully updated project."
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find_by_url(params[:id])
    if @project.destroy
      redirect_to projects_path, notice: "Successfully destroyed project."
    end
  end
  
  private

  def project_params
    params.require(:project).permit(:name, :content, :screenshot, :screenshot_cache, :website_url, :download_url, :source_code_url, :priority, :publish)
  end
  
end
