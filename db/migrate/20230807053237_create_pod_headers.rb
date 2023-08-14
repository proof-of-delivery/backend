class CreatePodHeaders < ActiveRecord::Migration[7.0]
  def change
    create_table :pod_headers do |t|
      t.references :pickup_order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
