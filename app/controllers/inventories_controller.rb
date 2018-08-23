class InventoriesController < ApplicationController
  before_action :current_inventory, only: [:show, :edit, :update]
  def index
    @inventories = Inventory.all
  end

  def show
  end

  def edit
    @products = @inventory.products
  end

  def update
  end

  private
  def inventory_params
    params.require(:inventory).permit(:seller_id)
  end

  def current_inventory
    @inventory = Inventory.find(params[:id])
  end
end
