require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe "#show" do
    context "Quando listar um usuário" do
      it "deve retorna status 200" do
        user = create(:user)

        get "/users/#{user.id}"
          
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)).to include("description")
        expect(JSON.parse(response.body)).to include("name")
        expect(JSON.parse(response.body)).to include("email")
        expect(JSON.parse(response.body)).to include("avatar")
        expect(JSON.parse(response.body)).to include("join_date")
      end
    end
  end
end