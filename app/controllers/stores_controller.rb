class StoresController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def list
    @stores = Store.order('created_at DESC')
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to check_stores_path
    else
      render :new
    end
  end

  def check
  end

  def show
    @store = Store.find(params[:id])
    @comments = @store.comments.includes(:user).order('created_at DESC')
  end
end

private

def store_params
  params.require(:store).permit(:store_name, :description, :image, :address, :phone_number, :bathing_fee, :sauna_temp, :water_temp, :prefecture_id, :rouryu_id, :outside_bath_id, :break_space_id).merge(user_id: current_user.id)
end
