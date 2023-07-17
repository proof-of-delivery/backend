class Customer < ApplicationRecord
    validates :name, :address, :primary_contact, :billing_contact, presence: true
end
