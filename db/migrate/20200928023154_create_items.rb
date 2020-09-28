class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t. string :name, null: false
      t. text :detail, null: false
      t. integer :category, null: false
      t. integer :condition, null: false
      t. integer :shipping_fee, null: false
      t. integer :shipping_place, null: false
      t. integer :prep_time, null: false
      t. integer :price, null: false
      t.timestamps
    end
  end
end
