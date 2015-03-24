class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def show
    @link = Link.find params[:id]
  end
  def new
    @link = Link.new
  end
  def edit
    @link = Link.find params[:id]
  end
  def create
    @link = Link.create link_params
    if @link.save
      flash[:notice] = 'link was successfully created.'
      redirect_to links_path
    else
      flash[:error] = 'link was NOT saved.'
      render :new
    end
  end


  def update
    @link = Link.find params[:id]
    @link.update link_params
    redirect_to link_path(@link)
  end

  def destroy
    @link = Link.find params[:id]
    @link.delete
    redirect_to links_path
  end

private

  def link_params
    params.require(:link).permit(
      :name,
      :url
      )
  end

end


