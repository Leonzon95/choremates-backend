class ChoresController < ApplicationController
    def create
        house = House.find_by_id(params[:house_id])
        chore = house.chores.build(chore_params)
        if (chore.save)
            render json: ChoreSerializer.new(chore)
        else
            render json: {error: chore.errors.full_messages.join(", ")}
        end
    end

    def update
        # house = House.find_by_id(params[:house_id])
        chore = Chore.find_by_id(params[:id])
        if chore.update(chore_params)
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
        params.require(:chore).permit(:name, :difficulty, :house_member_id)
    end
end
