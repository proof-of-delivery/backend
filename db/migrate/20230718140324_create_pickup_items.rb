# frozen_string_literal: true

class CreatePickupItems < ActiveRecord::Migration[7.0]
  def change
    create_table :pickup_items do |t|
      t.references :pickup_order, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.references :warehouse_item, null: false, foreign_key: true
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
