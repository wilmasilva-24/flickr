require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe "#show" do
    context "Quando listar um usuário" do
      it "deve retorna status 200" do
        user = User.create(name:"Wilma", email:"wilma@wilma.com", description:"Meu primeiro blog.")

        get "/users/#{user.id}"

        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)).to include("description")
      end
    end
  end
end