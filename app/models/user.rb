class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
  validates :last_name
  validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
  validates :last_name_kana
  validates :first_name_kana
  end
  validates :nickname, presence: true
  validates :birth_date, presence: true
  with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i } do
    validates :password
  end
  
end
