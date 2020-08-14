class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :item_name,      null: false
      t.string  :item_pic,       null: false
      t.text    :item_explain,   null: false
      t.integer :category_id,    null: false
      t.integer :quality_id,     null: false
      t.integer :deliveryfee_id, null: false
      t.integer :shipplace_id,   null: false
      t.integer :shipday_id,     null: false
      t.integer :price,          null: false
      t.timestamps
    end
  end
end
