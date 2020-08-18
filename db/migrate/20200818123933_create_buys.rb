class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.string  :item_name,      null: false
      t.text    :item_explain,   null: false
      t.integer :category_id,    null: false
      t.integer :quality_id,     null: false
      t.integer :deliveryfee_id, null: false
      t.integer :shipplace_id,   null: false
      t.integer :shipday_id,     null: false
      t.integer :price,          null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
