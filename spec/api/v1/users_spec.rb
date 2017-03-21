require "spec_helper"

describe "Api::v1::UsersStory", type: :api do
  describe "POST /v1/users" do
    before do
      authenticate_client
    end

    it "has validation" do
      post "/v1/users", { name: "Batman" }

      expect(http_status).to eq(422)
      expect(response_json[:error_code]).to eq("validation_failed")
      expect(response_json[:errors]).not_to be_nil
    end

    it "creates a user" do
      post "/v1/users", { name: "Batman", email: "batman@robin.com", password: "supersecretpassword" }

      expect(http_status).to eq(200)
      expect(response_json[:data][:attributes][:name]).to eq("Batman")
      expect(response_json[:data][:attributes][:email]).to eq("batman@robin.com")

      # Actually created the user
      expect(User.find(response_json[:data][:id]).email).to eq("batman@robin.com")
    end
  end
end
