class Customer < ApplicationRecord
    belongs_to :primary_contact, class_name: 'Contact'
    belongs_to :billing_contact, class_name: 'Contact'
    validates :name, :address, presence: true

    def self.ransackable_attributes(auth_object = nil)
        ['id', 'name', 'primary_contact','billing_contact', 'address', 'created_at', 'updated_at']
    end
end
