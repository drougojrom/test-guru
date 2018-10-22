class User < ApplicationRecord

  has_and_belongs_to_many :tests
  has_many :created_tests, class_name: 'Test', foreign_key: 'user_id'

  def completed_tests_for(level)
    tests.where(level: level)
  end
end
