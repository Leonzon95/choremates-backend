class ChoresController < ApplicationController
    def create
        house = House.find_by_id(params[:house_id])
        chore = house.chores.build(chore_params)
        if (chore.save)
            render json: ChoreSerializer.new(chore), status: 200
        else
            render json: {error: chore.errors.full_messages.join(", ")}, status: 400
        end
    end

    def update
        chore = Chore.find_by_id(params[:id])
        if chore.update(chore_params)
            if params[:houseMemberId]
                house_member = HouseMember.all.find_by_id(params[:houseMemberId])
                chore.house_member = house_member
                chore.save
            end
            render json: ChoreSerializer.new(chore)
        else
            render json: {error: chore.errors.full_messages.join(", ")}
        end
    end

    def destroy
        chore = Chore.find_by_id(params[:id])
        chore.destroy
    end

    private
    def chore_params
        params.require(:chore).permit(:name, :difficulty, :house_member_id, :day)
    end
end
