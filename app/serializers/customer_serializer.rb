class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :primary_contact, :billing_contact
end
