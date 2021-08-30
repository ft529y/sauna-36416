class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/stores/#{comment.store.id }"
  end


  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, store_id: params[:store_id])
  end
end
