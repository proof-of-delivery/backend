# frozen_string_literal: true

class CreatePickupOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :pickup_orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true
      t.datetime :pickup_date, null: false
      t.string :pickup_time, null: false
      t.string :pickup_order_no, null: false

      t.timestamps
    end
  end
end
