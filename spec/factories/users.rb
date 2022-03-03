FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "MyString" }
    description { "MyString" }
    avatar do Rack::Test::UploadedFile.new(
      Rails.root.join(
        'spec/images/paisagem.jpg'),
        'image/jpg'
      ) 
    end
  end
end
