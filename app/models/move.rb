class Move < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { minimum: 3 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :version, presence: true
  validates :user_id, presence: true
  validates :date, presence: true
end
