class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :cateogory
  belongs_to :user
  has_one_attached :image
end
