class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)\w{6,12}\z/.freeze
  validates :nickname, presence: true, uniqueness: true
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_kana, presence: true
  validates :first_kana, presence: true
  validates :birth_date, presence: true
end
