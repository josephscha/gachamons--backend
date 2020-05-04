class InventoriesController < ApplicationController
    def index
        inventories = Inventory.all 
        render json: inventories, except: [:created_at, :updated_at]
    end

    def show 
        inventory = Inventory.find(params[:id])
        render json: inventory
    end
end
