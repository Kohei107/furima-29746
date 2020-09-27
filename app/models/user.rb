class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i, message: ' Include both letters and numbers' }
  validates :birthday, presence: true

  with_options presence: true do
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
    NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/

    validates :family_name, format: { with: NAME_REGEX, message: 'Full-width characters.' }
    validates :first_name, format: { with: NAME_REGEX, message: 'Full-width characters.' }
    validates :family_name_kana, format: { with: NAME_KANA_REGEX, message: 'Full-width katakana characters.' }
    validates :first_name_kana, format: { with: NAME_KANA_REGEX, message: 'Full-width katakana characters.' }
  end
end
