class HouseMembersController < ApplicationController
    def create
        house = House.find_by_id(params[:house_id])
        member = house.house_members.build(member_params)
        byebug
        
    end

    private
    def member_params
        params.require(:house_member).permit(:name)
    end
end
