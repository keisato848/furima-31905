class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)\w{6,12}\z/.freeze
  with_options presence: true do
    validates :nickname, uniqueness: true
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は英字と数字の両方を含めて設定してください' }
    validates :last_name
    validates :first_name
    validates :last_kana
    validates :first_kana
    validates :birth_date
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: 'に全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: {
    with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
    message: '全角カタカナのみで入力して下さい'
  } do
    validates :last_kana
    validates :first_kana
  end
end
