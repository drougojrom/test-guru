class User < ApplicationRecord

  has_and_belongs_to_many :tests

  def completed_tests_for(level)
    tests.where(level: level)
  end
end
