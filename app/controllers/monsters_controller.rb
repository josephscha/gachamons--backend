class MonstersController < ApplicationController

    def index 
        monsters = Monster.all 
        render json: monsters, except: [:created_at, :updated_at]
    end

    def show
        monster = Monster.find(params[:id])
        render json: monster, except: [:created_at, :updated_at]
    end

    def destroy 
        monster = Monster.find(params[:id])
        monster.destroy
    end


end
