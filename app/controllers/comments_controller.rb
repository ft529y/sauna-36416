class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @store = Store.find(params[:store_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/stores/#{@comment.store.id}"
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :evaluation).merge(user_id: current_user.id, store_id: params[:store_id])
  end
end
