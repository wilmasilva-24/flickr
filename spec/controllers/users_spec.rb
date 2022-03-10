require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe "#GET show" do
    it "deve retorna status 200" do
      user = create(:user)
      photo = create(:photo, user: user)
      
      get "/users/#{user.id}"
      
      json_body = JSON.parse(response.body)
      binding.pry
      
      expect(response).to have_http_status(200)
      expect(json_body).to include("description")
      expect(json_body).to include("name")
      expect(json_body).to include("email")
      expect(json_body).to include("avatar")
      expect(json_body).to include("join_date")
      expect(json_body).to include("photos")
      expect(json_body["photos"][0]).to include ("id")
      expect(json_body["photos"][0]).to include ("image_url")
    end
  end
end