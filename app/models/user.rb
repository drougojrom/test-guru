class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_and_belongs_to_many :tests
  has_many :created_tests, class_name: 'Test', foreign_key: 'user_id'

  validates :email, presence: true, length: { maximum: 244 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }

  def completed_tests_for(level)
    tests.where(level: level)
  end
end
