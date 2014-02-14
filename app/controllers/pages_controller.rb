class PagesController < ApplicationController
  
  def index
    @pages = Page.order(:name).page(params[:page]).per(100)
  end
  
  def show
    @page = Page.find_by_url(params[:id])
  end
  
  def new
    @page = Page.new
  end
  
  def edit
    @page = Page.find_by_url(params[:id])
  end

  def create 
    @page = Page.new(page_params)
    if @page.save
      redirect_to @page, notice: "Successfully created page."
    else
      render :new
    end
  end
  
  def update
    @page = Page.find_by_url(params[:id])
    if @page.update_attributes(page_params)
      redirect_to @page, notice: "Successfully updated page."
    else
      render :edit
    end
  end

  def destroy
    @page = Page.find_by_url(params[:id])
    if @page.destroy
      redirect_to pages_path, notice: "Successfully destroyed page."
    end
  end
  
  private

  def page_params
    params.require(:page).permit(:name, :content, :publish)
  end
  
end
