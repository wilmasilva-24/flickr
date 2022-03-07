require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe "#GET show" do
    it "deve retorna status 200" do
      user = create(:user)

      get "/users/#{user.id}"
      
      json_body = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(json_body).to include("description")
      expect(json_body).to include("name")
      expect(json_body).to include("email")
      expect(json_body).to include("avatar")
      expect(json_body).to include("join_date")
    end
  end
end