require 'rails_helper'

RSpec.describe PhotosController, type: :request do
  describe "GET index" do
    it "deve retornar status 200" do
      user = create(:user)
      photo = create(:photo, user: user)
      
      get "/photos", params: {user_id: user.id}
      
      json_body = JSON.parse(response.body)
      
      expect(response).to have_http_status(200)
      expect(json_body[0]).to include("image_url")
      expect(json_body[0]).to include("id")
    end
  end

  describe "GET #show" do
    it "deve retornar apenas foto do id selecionado" do
      user = create(:user)
      photo = create(:photo, user: user)

      get "/photos/#{photo.id}"
      
      json_body = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(json_body).to include("image_url")
      expect(json_body).to include("id")
    end
  end
  
  describe "POST create" do
    context "adicionar foto" do
      it "deve retornar status 201" do
        user = create(:user)
        photo_params = {photo: attributes_for(:photo, user_id: user.id)}
        
        post "/photos", params: photo_params
        
        expect(response).to have_http_status(201)
        expect(JSON.parse(response.body)).to include("image_url")
      end
    end
  end
end