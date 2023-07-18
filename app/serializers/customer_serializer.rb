class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :primary_contact_id, :billing_contact_id
end
