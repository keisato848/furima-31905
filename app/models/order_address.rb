class Order_address
  include Activemodel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :telephone_number
  
  with_options presense: true do
    validates :postal_code format{ with: /\A\d{3}[-]\d{4}\z/ } 
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :address
    validates :telephone_number, format{ /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/ }
  end

end