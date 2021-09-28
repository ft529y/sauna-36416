class StoresController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :create_searching_prefecture, only: [:list, :search_prefecture, :searching_prefecture]
  before_action :create_searching_keyword, only: [:list, :search_keyword, :searching_keyword]

  def index
  end

  def list
    @stores = Store.order('created_at DESC')
  end

  def search_keyword
    @results = @p.result.order('created_at DESC')
  end

  def searching_keyword
    @results = @p.result.order('created_at DESC')
  end

  def search_prefecture
    @results = @p.result.order('created_at DESC')
  end

  def searching_prefecture
    @results = @p.result.order('created_at DESC')
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
  params.require(:store).permit(:store_name, :description, :image, :address, :phone_number, :bathing_fee, :sauna_temp,
                                :water_temp, :prefecture_id, :rouryu_id, :outside_bath_id, :break_space_id).merge(user_id: current_user.id)
end

def create_searching_prefecture
  @p = Store.ransack(params[:q])
end

def create_searching_keyword
  @p = Store.ransack(params[:q])
end