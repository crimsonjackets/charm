class Account < ActiveRecord::Base
  has_secure_password

  validates :email,
    presence: true

  validates :email,
    uniqueness: true,
    unless: -> { email.blank? }

  validates :password,
    presence: true,
    on: :create
end
