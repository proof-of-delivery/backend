# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  has_secure_password

  validates :email, :name, :password, presence: true
  validates :email, uniqueness: true
end
