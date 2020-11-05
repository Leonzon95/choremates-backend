require "rails_helper"

describe ChoresController, type: :controller do 
    describe "#create" do 
        before do 
            house = House.new(name: "test")
            house.save
        end
        context "when a chore is valid" do 
            before do
                post :create, params: {house_id: 1, chore: {name: "Clean", difficulty: "hard"}}
            end
            it "renders serializer of chore" do 
                json_response = JSON.parse(response.body)
                expect(json_response.keys).to match_array(["data"])
            end

            it "returns http code 200" do 
                expect(response).to have_http_status(200)
            end
        end

        context "when a chore is invalid" do
            it "returns error when name & difficulty not present" do 
                post :create, params: {house_id: 1, chore: {name: "", difficulty: ""}}
                json_response = JSON.parse(response.body)
                expect(json_response.keys).to match_array("error")
                expect(response).to have_http_status(400)
            end

            it "returns error when name not present" do 
                post :create, params: {house_id: 1, chore: {name: "", difficulty: "Easy"}}
                json_response = JSON.parse(response.body)
                expect(json_response.keys).to match_array("error")
                expect(response).to have_http_status(400)
            end

            it "returns error when difficulty not present" do 
                post :create, params: {house_id: 1, chore: {name: "Clean", difficulty: ""}}
                json_response = JSON.parse(response.body)
                expect(json_response.keys).to match_array("error")
                expect(response).to have_http_status(400)
            end
        end
    end

    describe "#update" do
        context "updating with valid data" do
            before do 
                house = House.new(name: "test")
                house.save
                house.chores.create(name: "Clean", difficulty: "Easy")
            end

            it "updates chore without assinging" do 
                patch :update, params: {id: 1, house_id: 1,houseMemberId: nil, chore: {name: "Clean Kitchen", difficulty: "Hard" }}
                json_response = JSON.parse(response.body)
                new_name = json_response["data"]["attributes"]["name"]
                new_difficulty = json_response["data"]["attributes"]["difficulty"]
                
                expect(new_name).to eq("Clean Kitchen")
                expect(new_difficulty).to eq("Hard")
            end
        end
    end
end
