class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :primary_contact, null: false
      t.string :billing_contact, null: false

      t.timestamps
    end
  end
end
