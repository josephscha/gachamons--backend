class InventoriesController < ApplicationController
    def index
        inventories = Inventory.all 
        render json: inventories, except: [:created_at, :updated_at]
    end

    def show 
        inventory = Inventory.find(params[:id])
        render json: inventory, except: [:created_at, :updated_at]
    end

    def edit 
        
    end

    def update
        inventory = Inventory.find(params[:id])
        inventory.update(inventory_params)
        render json: inventory, except: [:created_at, :updated_at]
    end

    def create
        inventory = Inventory.create(inventory_params)
        render json: inventory, except: [:created_at, :updated_at]
    end



    private 

    def inventory_params
        params.require(:inventory).permit(:user_id, :item_id, :quantity)
    end
end
