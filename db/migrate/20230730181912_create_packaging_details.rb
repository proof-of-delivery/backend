class CreatePackagingDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :packaging_details do |t|
      t.string :package_type
      t.float :weight, null: false
      t.float :length, null:false
      t.float :width, null: false
      t.float :height, null: false
      t.string :cbm, null: false

      t.timestamps
    end
  end
end
