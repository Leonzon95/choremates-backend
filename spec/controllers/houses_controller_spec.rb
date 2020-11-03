require 'rails_helper'

RSpec.describe HousesController, type: :controller do
    describe "#show" do 
        context "valid house" do
            before do
                house = House.new(name: "test") 
                house.save
                get :show, params: {id: "test", format: :json}
            end

            it "returns http success" do 
                expect(response).to have_http_status(:success)
            end
            
            it "renders house json when house is found" do 
                json_response = JSON.parse(response.body)

                expect(json_response.keys).to match_array(["data", "included"])
            end
        end
        
        context "invalid house" do 
            before do
                house = House.new
                get :show, params: {id: "not"}
            end

            it "returns 404 not found" do 
                expect(response).to have_http_status(:not_found)
            end

            it "renders json with errors" do 
                json_response = JSON.parse(response.body)

                expect(json_response.keys).to match_array(["error"])
            end
        end
    end

    describe '#create' do 
        
    end
end