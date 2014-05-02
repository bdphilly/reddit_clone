class LinksController < ApplicationController
  before_action :ensure_signed_in

  def new
    @link = Link.new
  end

  def show
    @link = Link.find(params[:id])
  end

  def create
    # @sub = Sub.find(params[:sub][:id])
    # @link = @sub.links.new(link_params)
    # @link.submitter_id = current_user.id

    # @link = @link.new(link_params).sub

    @link = current_user.links.new(link_params)

    if @link.save

      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      redirect_to link_url(@link)
    else
      flash[:errors] = @link.errors.full_messages
      render :edit
    end
  end

  def link_params
    params.require(:link).permit(:url, :title, :submitter_id,
      { :sub_ids => [] })
  end

end
