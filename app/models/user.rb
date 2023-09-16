class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "を全角で入力してください"}
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "を全角で入力してください"}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: "をカタカナで入力してください" }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: "をカタカナで入力してください" }
  
  with_options presence: true do
    validates :nickname
    validates :birthday
  end
end