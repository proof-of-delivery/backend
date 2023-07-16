class Customer < ApplicationRecord
  validates :name, presence: true
  validates :primary_contact, presence: true

end
