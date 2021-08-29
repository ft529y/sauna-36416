class StoresController < ApplicationController
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
      redirect_to root_path
    else
      render :new
    end
  end
end

def show
  @store = Store.find(params[:id])
end

private

def store_params
  params.require(:store).permit(:store_name, :description, :image).merge(user_id: current_user.id)
end