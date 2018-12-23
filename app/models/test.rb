class Test < ApplicationRecord

  belongs_to :author, class_name: 'User', foreign_key: :author_id, inverse_of: :authored_tests
  belongs_to :category
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  validates :title, presence: true,
    uniqueness: { scope: :level, message: 'this test already exists' }
  validates :level, presence: true, numericality: { greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :intermediate, -> { where(level: 2..4) }
  scope :advanced, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, -> (title) { joins(:category).where(categories: {title: title }) }
  scope :by_level, -> (level) { where(level: level) }

  def self.sorted_by_category(title)
    by_category(title).order(title: :desc).pluck(:title)
  end
end
