class SummonsController < ApplicationController
    def index
        summons = Summon.all 
        render json: summons, except: [:created_at, :updated_at]
    end

    def show 
        summon = Summon.find(params[:id])
        render json: summon
    end
end
