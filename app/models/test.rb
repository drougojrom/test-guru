class Test < ApplicationRecord

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category
  has_and_belongs_to_many :users
  has_many :questions

  validates :title, presence: true,
    uniqueness: { scope: :level, message: 'this test already exists' }
  validates :level, presence: true, numericality: { greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :intermediate, -> { where(level: 2..4) }
  scope :advanced, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, -> (title) { joins(:category).where(categories: {title: title }).order(title: :desc) }

  def self.sorted_by_category(title)
    by_category(title).pluck(:title)
  end
end
