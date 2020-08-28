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

    def update
        member = HouseMember.find_by_id(params[:id])
        member.update(member_params)
    end

    def destroy
        member = HouseMember.find_by_id(params[:id])
        member.chores.each do |chore| 
            chore.house_member = nil
            chore.save
        end
        member.destroy
    end

    private
    def member_params
        params.require(:house_member).permit(:name)
    end
end
