class Category < ApplicationRecord
  has_many :tests

  scope :sorted, -> { order(title: :asc) }
end
