class CreatePodHeaders < ActiveRecord::Migration[7.0]
  def change
    create_table :pod_headers do |t|
      t.references :pickup_order, null: false, foreign_key: true
      t.string :pickedup_data
      t.datetime :pickedup_time
      t.references :customer, null: false, foreign_key: true
      t.string :freight_forwarder
      t.references :warehouse_order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
