class SummonsController < ApplicationController
    def index
        summons = Summon.all 
        render json: summons, except: [:created_at, :updated_at]
    end

    def show 
        summon = Summon.find(params[:id])
        render json: summon, except: [:created_at, :updated_at]
    end

    def create 
        summon = Summon.create(summon_params)
        render json: summon, except: [:created_at, :updated_at]
    end

    private 

    def summon_params 
        params.require(:summon).permit!
    end
end
