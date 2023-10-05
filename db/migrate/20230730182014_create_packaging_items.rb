# frozen_string_literal: true

class CreatePackagingItems < ActiveRecord::Migration[7.0]
  def change
    create_table :packaging_items do |t|
      t.references :packaging_detail, null: false, foreign_key: true
      t.references :pickup_item, null: false, foreign_key: true
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
