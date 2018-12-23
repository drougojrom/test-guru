class Rule < ApplicationRecord
  has_many :badges, dependent: :nullify
  validates :name, presence: true
  validates :rule_type, presence: true

  def passes?(test_passage)
    case rule_type
    when 'first_hit'
      first_hit?(test_passage)
    when 'by_level'
      by_level?(test_passage, value)
    when 'by_failed'
      by_failed?(test_passage, value)
    else
      false
    end
  end

  def first_hit?(test_passage)
    test_passage.user.test_passages.passed.count == 1
  end

  def by_level?(test_passage, level)
    passed_tests = test_passage.user.test_passages.passed.by_level(level)
    unique_tests = passed_tests.uniq.count
    Test.by_level(level).count == unique_tests && passed_tests.count == unique_tests
  end

  def by_failed?(test_passage, value)
    failed_tests_count = test_passage.user.test_passages.failed.count
    if value > 0 
      (failed_tests_count % value) == 0 && failed_tests_count > 0
    end
  end
end
