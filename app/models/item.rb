class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :state
    belongs_to :prefecture
    belongs_to :shipping_fee_burden
    belongs_to :delivery_day

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :item_fee
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :prefecture_id
    validates :shipping_fee_burden_id
    validates :delivery_day_id
  end

  validates :item_fee, format: /\A[0-9]+\z/,
    :numericality => {
    :greater_than_or_equal_to => 300,
    :less_than_or_equal_to => 9999999,
    :message => 'は300円から9999999円の範囲で入力してください'
  }

end
