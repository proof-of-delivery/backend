class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.integer :position, null: false
      t.integer :item_no, null: false
      t.string :description, null: false
      t.string :supplier_item_id, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
