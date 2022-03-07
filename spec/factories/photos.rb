FactoryBot.define do
  factory :photo do
    user { nil }
    image do Rack::Test::UploadedFile.new(
      Rails.root.join(
        'spec/images/paisagem.jpg'),
        'image/jpg'
      ) 
    end
  end
end
