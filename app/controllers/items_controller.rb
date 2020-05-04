class ItemsController < ApplicationController
    def index
        items = Item.all 
        render json: items, except: [:created_at, :updated_at]
    end

    def show 
        item = Item.find(params[:id])
        render json: item
    end

    def destroy 
        item = Item.find(params[:id])
        item.destroy
    end

    def update 
        
    end
end
