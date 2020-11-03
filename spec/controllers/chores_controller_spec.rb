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
end
