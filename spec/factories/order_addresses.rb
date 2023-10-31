FactoryBot.define do
  factory :order_address do
    postal_code         { '123-4567' }
    prefecture_id       { 2 }
    city                { '東京都' }
    house_number        { '1-1' }
    building_name       { 'テストハイツ' }
    telephone_number    { '12345678901' }
  end
end
