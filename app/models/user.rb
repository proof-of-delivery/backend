class User < ApplicationRecord
    has_secure_password

    validates :user_name, :email, :password_digest, presence: true
end
