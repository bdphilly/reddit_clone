class CommentsController < ApplicationController
  before_action :ensure_signed_in

  def new
    render :new
  end

  def create
    @link = Link.find(params[:id])
    @comment = @link.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to link_url(@comment.link)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to new_link_comment_url(@link)
    end
  end

  def show
    @comment = Comment.find(params[:id])
    if @comment
      render :show
    else
      redirect_to subs_url
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :parent_comment_id)
  end


end
