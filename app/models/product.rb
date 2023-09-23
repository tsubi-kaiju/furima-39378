class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_duration
  belongs_to :shipping_fee_bearer
  belongs_to :shipping_origin

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },
              format: { with: /\A[0-9]+\z/}
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :shipping_fee_bearer_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :shipping_origin_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :shipping_duration_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :image
  end
end
