FactoryBot.define do
  factory :comment do
    title { "Comentário" }
    message { "Nova mensagem" }
    photo { nil }
    user { nil }
  end
end
