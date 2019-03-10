class Place < ApplicationRecord
  belongs_to :user
  validates :name, presence: true: { minimum: 3 }
  validates :address, presence:
  validates :descrition, presence:
end