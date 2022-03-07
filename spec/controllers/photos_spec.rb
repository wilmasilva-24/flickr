require 'rails_helper'

RSpec.describe PhotosController, type: :request do
  describe "index" do
    context "retornar lista de fotos" do
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
  end

  describe "GET #show" do
    context "Exibir uma foto por vez" do
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
  end
  
  # describe "create" do
  #   context "adicionar foto" do
  #     it "deve retornar status 201" do
  #       user = create(:user)
  #       photo_params = {photo: attributes_for(:photo, image_url: "spec/images/patrulha.jpg", user_id: user.id)}
        
  #       post "/photos", params: photo_params
  #       # binding.pry
  #       expect(response).to have_http_status(201)
  #       expect(Photo.last.user_id).to eq(1)
  #       # expect(photo.image_url).to eq("spec/images/patrulha.jpg")
  #       expect(JSON.parse(response.body)["image_url"][0]).to eq("spec/images/patrulha.jpg")
        


  #     end
  #   end
  # end
end