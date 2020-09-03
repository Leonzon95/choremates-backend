class HouseChannel < ApplicationCable::Channel
    def subscribed
        house = House.find(params[:house_id])
        stream_for(house)
    end
end