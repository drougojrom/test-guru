class Test < ApplicationRecord

  belongs_to :category
  has_and_belongs_to_many :users

  scope :by_category, -> (title) { joins(:category).where(categories: {title: title }) }

  def self.sorted_by_category(title)
    by_category(title)
  end
end
