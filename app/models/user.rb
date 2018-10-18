class User < ApplicationRecord

  has_and_belongs_to_many :tests

  def completed_tests_for(level)
    tests.select { |test| test.level == level }
  end
end
