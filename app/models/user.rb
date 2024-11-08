class User < ApplicationRecord
  has_many :rentals

  validates :name, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
