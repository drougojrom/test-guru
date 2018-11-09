require 'digest/sha1'

class User < ApplicationRecord

  include Auth

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'user_id'

  has_secure_password

  def completed_tests_for(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.find_by(test_id: test.id)
  end
end
