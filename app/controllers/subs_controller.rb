class SubsController < ApplicationController
  before_action :ensure_signed_in
  before_action :ensure_moderator, only: [:edit, :update, :destroy]

  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id

    @sub.links.new(link_params)
    @sub.links.each {|link| link.submitter_id = current_user.id }

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])
    # fail
    if @sub.update_attributes(sub_params) &&
        @sub.links.each_with_index do |link, i|
          link.update_attributes(link_params[i])
        end

      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  private
  def sub_params
    params.require(:sub).permit(:moderator_id, :name)
  end

  def link_params
    params.permit(:links => [:url, :title])
          .require(:links)
          .values
          .reject { |data| data.values.all?(&:blank?) }
  end

end
