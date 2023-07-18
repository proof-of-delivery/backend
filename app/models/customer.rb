class Customer < ApplicationRecord
    belongs_to :primary_contact, class_name: 'Contact'
    belongs_to :billing_contact, class_name: 'Contact'
    validates :name, :address, presence: true
end
