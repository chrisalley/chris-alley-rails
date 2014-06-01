class QualificationsController < ApplicationController
  before_action :load_qualification, except: [:index, :new, :create]

  def index
    @qualifications = policy_scope(Qualification.order("year_completed desc").page(params[:qualification]).per(100))
  end

  def new
    @qualification = Qualification.new
    authorize @qualification
  end

  def create
    @qualification = Qualification.new(qualification_params)
    authorize @qualification
    if @qualification.save
      redirect_to qualifications_path, notice: "Successfully created qualification."
    else
      render :new
    end
  end

  def update
    if @qualification.update_attributes(qualification_params)
      redirect_to qualifications_path, notice: "Successfully updated qualification."
    else
      render :edit
    end
  end

  def destroy
    @qualification.destroy
    redirect_to qualifications_path, notice: "Successfully destroyed qualification."
  end

  private

  def qualification_params
    params.require(:qualification).permit(
      :name,
      :education_provider,
      :year_completed,
      :content,
      :certificate,
      :certificate_cache,
      :publish
    )
  end

  def load_qualification
    @qualification = Qualification.find_by url: params[:id]
    authorize @qualification
  end
end
