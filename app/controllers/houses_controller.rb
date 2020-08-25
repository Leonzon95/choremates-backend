class HousesController < ApplicationController
    def create 
        house = House.new(name: params[:name])
        if house.save   
            render json: HouseSerializer.new(house)
        else  
            render json: {error: house.errors.full_messages.join(", ")}
        end
    end
    
    def show
        house = House.find_by(name: params[:id])
        if house
            render json: HouseSerializer.new(house)
        else
            render json: {error: 'House does not exist'}
        end
    end
end
