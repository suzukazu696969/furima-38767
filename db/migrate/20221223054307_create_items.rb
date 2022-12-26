class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.integer :price, null: false
      t.text :delivery, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :commodity_condition_id, null: false
      t.integer :shipping_charge_id, null: false
      t.integer :region_of_origin_id, null: false
      t.integer :days_to_ship_id, null: false
      t.integer :category_id, null: false
      t.timestamps
    end
  end
end
