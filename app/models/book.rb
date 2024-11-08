class Book < ApplicationRecord
  belongs_to :author
  has_many :rentals

  validates :title, presence: true
end
