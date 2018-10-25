class Category < ApplicationRecord
  has_many :tests

  scope :sorted, -> { order(title: :asc) }

  validate :title, presence: true,
    uniqueness: true
end
