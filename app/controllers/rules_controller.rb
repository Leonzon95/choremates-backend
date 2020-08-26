class RulesController < ApplicationController
    def create
        house = House.find_by_id(params[:house_id])
        rule = house.rules.build(rule_params)
        if rule.save
            render json: RuleSerializer.new(rule)
        else
            render json: {error: rule.errors.full_messages.join(", ")}
        end
    end

    private
    def rule_params
        params.require(:rule).permit(:description)
    end
end
