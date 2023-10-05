# frozen_string_literal: true

class AddColumnsToWarehouseOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :warehouse_orders, :customer, null: false, foreign_key: true
  end
end
