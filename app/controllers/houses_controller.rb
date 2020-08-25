class HousesController < ApplicationController
    def create 
        house = House.new(name: params[:name])
        if house.save   
            render json: HouseSerializer.new(house)
        else  
            render json: {error: 'House name already exists'}
        end
    end
end
