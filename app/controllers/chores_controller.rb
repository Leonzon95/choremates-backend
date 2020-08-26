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

    private
    def chore_params
        params.require(:chore).permit(:name)
    end
end
