class PagesController < ApplicationController
  load_resource find_by: :url
  authorize_resource
  
  def index
    @pages = Page.accessible_by(current_ability).order(:name).page(params[:page]).per(100)
  end

  def create 
    @page = Page.new(page_params)
    if @page.save
      redirect_to @page, notice: "Successfully created page."
    else
      render 'new'
    end
  end
  
  def update
    if @page.update_attributes(page_params)
      redirect_to @page, notice: "Successfully updated page."
    else
      render 'edit'
    end
  end

  def destroy
    @page.destroy
    redirect_to pages_path, notice: "Successfully destroyed page."
  end
  
  private

  def page_params
    params.require(:page).permit(:name, :content, :publish)
  end  
end
