class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :list, :unsubscribe, :withdrawal]
  before_action :set_params, only: [:show, :list, :unsubscribe, :withdrawal]
  before_action :check_user, only: [:list, :unsubscribe, :withdrawal]

  require 'date'

  def index
  end

  def show
  end

  def list
    @comments = @user.comments.includes(:store).order('created_at DESC')
  end

  def unsubscribe
  end

  def withdrawal
    @user.update(is_deleted: true)
    date_time = DateTime.now
    deleted_email = @user.email + date_time.strftime('%Y%m%d%H%M')
    @user.update(email: deleted_email)
    reset_session
    flash[:notice] = '退会処理を実行いたしました'
    redirect_to root_path
  end
end

private

def set_params
  @user = User.find(params[:id])
end

def check_user
  unless current_user.id == @user.id
    redirect_to root_path
  end
end