class HousesController < ApplicationController
    def create 
        house = House.new(name: params[:name])
        if house.save   
            render json: HouseSerializer.new(house), status: 200
        else
            render json: {error: house.errors.full_messages.join(", ")}
        end
    end
    
    def show
        house = House.find_by(name: params[:id])
        options = {include: [:house_members, :rules, :chores]}

        if house
            render json: HouseSerializer.new(house, options)
        else
            render json: {error: 'House does not exist'}, status: 404
        end
    end
end