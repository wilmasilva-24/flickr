require 'rails_helper'

RSpec.describe PhotosController, type: :request do
  describe "GET index" do
    context "filtrando por autor das fotos" do
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
    context "sem filtrar por usuário" do
      it "deve retornar todas as fotos" do
        user = create(:user)
        photo = create(:photo, user: user)
        
        get "/photos"
              
        json_body = JSON.parse(response.body)
        
        expect(json_body[0]).to include("image_url")
        expect(json_body[0]).to include("id")
      end
    end
    context "filtrando por data" do
      it "deve retornar fotos por data" do
        user = create(:user,name:"wilma")
        photo = create(:photo, user: user, created_at:"2022-04-01")
        photo2 = create(:photo, user: user, created_at:"2022-04-11")

        get "/photos", params: {start_date: "2022-04-01", end_date: "2022-04-10"}
      
        json_body = JSON.parse(response.body)
        
        expect(json_body[0]).to include("image_url")
        expect(json_body[0]).to include("id")
        expect(json_body.count).to eq(1)
      end
    end
  end

  describe "GET #show" do
    it "deve retornar apenas foto do id selecionado" do
      user = create(:user, email: "wilma@hotmail.com")
      photo = create(:photo, user: user)

      get "/photos/#{photo.id}"
     
      json_body = JSON.parse(response.body)
           
      expect(response).to have_http_status(200)
      expect(json_body).to include("image_url")
      expect(json_body).to include("id")
      expect(photo.visualizations.count).to eq(1)
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
    context "quando o usuário estiver ativo" do
      it "deve adicionar foto" do
        user = create(:user, active: true)
        add_photo = {photo: attributes_for(:photo, user_id: user.id)}

        post "/photos", params: add_photo

        expect(JSON.parse(response.body)).to include("image_url")
      end
    end
    context "quando usuário estiver inativo" do
      it "deve retornar status 422" do
        user = create(:user, active: false)
        add_photo_false = {photo: attributes_for(:photo, user_id: user.id)}

        post "/photos", params: add_photo_false

        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)['message']).to eq('O usuaŕio não está ativo')

      end
    end
  end

  describe "GET comments" do
    it "deve retornar os comentários da foto" do
      user = create(:user, name: "wilma", description: "novo usuário")
      photo = create(:photo, user: user)
      comment = create(:comment, title:"Comentário", user: user, photo: photo)
      
      get "/photos/#{photo.id}/comments"
      
      json_body = JSON.parse(response.body)
      
      expect(json_body[0]["title"]).to eq ("Comentário")
      expect(json_body[0]["message"]).to eq ("Suas fotos são muito boas")
      expect(json_body[0]["user"]["name"]).to eq("wilma")
      expect(json_body[0]["user"]["email"]).to eq("MyString")
      expect(json_body[0]["user"]["description"]).to eq("novo usuário")
    end
  end
end