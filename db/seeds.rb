# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
def seed_customers
    customer1 = Customer.create!(
      name: "Acme Corporation",
      address: "123 Main Street, Anytown, CA 12345",
      primary_contact_id: Contact.create!(
        name: "John Smith",
        email: "john.smith@acme.com",
        phone_number: "123-456-7890"
      ).id,
      billing_contact_id: Contact.create!(
        name: "Jane Doe",
        email: "jane.doe@acme.com",
        phone_number: "456-789-0123"
      ).id
    )
  
    customer2 = Customer.create!(
      name: "XYZ Company",
      address: "456 Elm Street, Anytown, CA 12345",
      primary_contact_id: Contact.create!(
        name: "Mary Jones",
        email: "mary.jones@xyz.com",
        phone_number: "567-890-1234"
      ).id,
      billing_contact_id: Contact.create!(
        name: "Bill Brown",
        email: "bill.brown@xyz.com",
        phone_number: "789-012-3456"
      ).id
    )
  end
  

def seed_warehouse_orders
    customer1 = Customer.find(1)
    customer2 = Customer.find(2)
  
    4.times do |i|
      warehouse_order = WarehouseOrder.create!(
        doc_no: "PO-#{i + 12345}",
        name_of_ship: customer1.name,
        delivery_date: Date.today + (i + 1).week,
        delivery_address: customer1.address,
        customer_id: customer1.id
      )
  
      3.times do |j|
        warehouse_order_item = WarehouseItem.create!(
          warehouse_order_id: warehouse_order.id,
          item_id: Item.create!(
            item_no: "#{i + 12345}-#{j + 1}",
            description: "Widget #{i + j + 1}",
            sales_order_no: "SO-98433",
            position: j,
            unit: "pcs"
          ).id,
          quantity: 10,
          picked_up_quantity: 0
        )
      end
    end
  
    4.times do |i|
      warehouse_order = WarehouseOrder.create!(
        doc_no: "PO-#{i + 67890}",
        name_of_ship: customer2.name,
        delivery_date: Date.today + (i + 1).week,
        delivery_address: customer2.address,
        customer_id: customer2.id
      )
  
      3.times do |j|
        warehouse_order_item = WarehouseItem.create!(
          warehouse_order_id: warehouse_order.id,
          item_id: Item.create!(
            item_no: "#{i + 67890}-#{j + 1}",
            description: "Gizmo #{i + j + 1}",
            sales_order_no: "SO-65433",
            position: j,
            unit: "pcs"
          ).id,
          quantity: 10,
          picked_up_quantity: 0
        )
      end
    end
  end
seed_customers
seed_warehouse_orders