class Author < ApplicationRecord
  has_many :books

  validates :name, presence: true
  validates :name, length: { maximum: 100 }
end
