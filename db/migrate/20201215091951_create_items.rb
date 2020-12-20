class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      
      t.string :name, null: false
      t.text :explanation, null: false
      t.string :category, null: false
      t.text :state, null: false
      t.string :delivery_fee, null: false
      t.integer :prefecture_id, null: false
      t.integer :date_to_delivery, null: false
      t.integer :item_fee, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
