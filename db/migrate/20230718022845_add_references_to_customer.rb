class AddReferencesToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_reference :customers, :primary_contact, null: false, index: { name: 'primary_indx'},
                  foreign_key: { to_table: :contacts }
    add_reference :customers, :billing_contact, null: false, index: { name: 'billing_indx'},
                  foreign_key: { to_table: :contacts }
  end
end
