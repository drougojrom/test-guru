class Test < ApplicationRecord

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category
  has_and_belongs_to_many :users
  has_many :questions

  scope :easy, -> { where(level: 0..1) }
  scope :intermediate, -> { where(level: 2..4) }
  scope :advanced, -> { where(level: 5..Float::INFINITY) }
  scope :sorted_by_category, -> (title) { joins(:category).where(categories: {title: title }).order(title: :desc).pluck(:title) }

end
