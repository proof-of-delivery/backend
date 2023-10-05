# frozen_string_literal: true

class Customer < ApplicationRecord
  belongs_to :primary_contact, class_name: "Contact"
  belongs_to :billing_contact, class_name: "Contact"
  validates :name, :address, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[name address primary_contact_id billing_contact_id id created_at updated_at]
  end
end
