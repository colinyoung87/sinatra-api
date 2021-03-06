require "spec_helper"

describe "Api::oAuth", type: :api do
  describe "POST /oauth/token" do
    let!(:client_application) { create(:client_application, name: "Tasty Coffee") }
    let!(:user) { create(:user, password: "strongcoffee") }

    before do
      authenticate_client(client_application)
    end

    it "requires valid login details" do
      post "/oauth/token", { email: user.email, password: "milkycoffee" }

      expect(http_status).to eq(401)
      expect(response_json["message"]).to match(/Authentication failed/)
    end

    it "returns an oauth token" do
      post "/oauth/token", { email: user.email, password: "strongcoffee" }

      expect(http_status).to eq(200)
      expect(json_attrs["token"]).to be_a(String)
      expect(json_attrs["client"]).to eq("Tasty Coffee")
    end
  end
end
