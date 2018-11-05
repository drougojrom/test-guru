class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'user_id'

  validates :email, presence: true, length: { maximum: 244 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensetive: false }

  def completed_tests_for(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.find_by(test_id: test.id)
  end
end
