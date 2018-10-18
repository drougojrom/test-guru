class User < ApplicationRecord

  attr_accessor :completed_tests

  def completed_tests_for(level)
    completed_tests.select { |test| test.level == level }
  end
end
