require 'rails_helper'

RSpec.describe CommentsController, type: :request do
  describe "Post #Create" do
    context "Quando criar um comentário" do
      it "Deve retornar o status 201" do
      user = create(:user)
      photo = create(:photo, user: user)
      comment_params = {comment: attributes_for(:comment, user_id: user.id, photo_id: photo.id)}

      post "/comments", params: comment_params

      json_body = JSON.parse(response.body)

      expect(response).to have_http_status(201)
      expect(json_body).to include("message")
      expect(json_body).to include("title")     
      end
    end
  end
end