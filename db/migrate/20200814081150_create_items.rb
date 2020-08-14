class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.string :item_pic, null: false
      t.text :item_explain, null: false
      t.string :item_catego, null: false
      t.string :quality, null: false
      t.integer :deliv_fee, null: false
      t.string :ship_place, null: false
      t.integer :ship_days, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
