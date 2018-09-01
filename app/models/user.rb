class User < ApplicationRecord
  validates :email, :password, presence: true
  has_secure_password
end
