FactoryBot.define do
  factory :product do
    name                    { Faker::Lorem.characters(number: rand(1..40)) }
    description             { Faker::Lorem.characters(number: rand(1..1000)) }
    price                   { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id             { Faker::Number.between(from: 2, to: 11) }
    condition_id            { Faker::Number.between(from: 2, to: 7) }
    shipping_fee_bearer_id  { Faker::Number.between(from: 2, to: 3) }
    shipping_origin_id      { Faker::Number.between(from: 2, to: 48) }
    shipping_duration_id    { Faker::Number.between(from: 2, to: 4) }

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
