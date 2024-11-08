class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :start_date, presence: true
  validates :end_date,
    comparison: { greater_than: :start_date },
    allow_blank: true,
    if: -> { end_date.present? }
end
