class HouseMembersController < ApplicationController
    def create
        house = House.find_by_id(params[:house_id])
        member = house.house_members.build(member_params)
        if member.save
            render json: HouseMemberSerializer.new(member)
        else
            render json: {error: member.errors.full_messages.join(", ")}
        end
    end

    private
    def member_params
        params.require(:house_member).permit(:name)
    end
end
