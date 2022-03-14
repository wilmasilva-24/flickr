FactoryBot.define do
  factory :comment do
    title { "Foto bonita!!" }
    message { "Suas fotos são muito boas" }
    photo { nil }
    user { nil }
  end
end
