class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :unsubscribe, :withdrawal]
  require 'date'

  def index
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.includes(:store).order('created_at')
  end

  def unsubscribe
    @user = User.find(params[:id])
  end

  def withdrawal
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    date_time = DateTime.now
    deleted_email = @user.email + date_time.strftime('%Y%m%d%H%M')
    @user.update(email: deleted_email)
    reset_session
    flash[:notice] = '退会処理を実行いたしました'
    redirect_to root_path
  end
end
