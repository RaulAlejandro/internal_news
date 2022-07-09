FactoryBot.define do
  factory :post do
    # Attributes
    title { Faker::Lorem.word }
    summary { Faker::Lorem.paragraph }
    content { Faker::Lorem.paragraph(sentence_count: 12) }
    # Associations
    user
  end
end