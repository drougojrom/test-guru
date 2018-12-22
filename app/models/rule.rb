class Rule < ApplicationRecord
  has_many :badges, dependent: :nullify
  validates :name, presence: true
  validates :rule_type, presence: true

  def passes?(test_passage)
    case type
    when 'first_hit'
      first_hit?(test_passage)
    when 'by_level'
      by_level?(test_passage)
    when 'by_failed'
      by_failed?(test_passage)
    else
      false
    end
  end

  def first_hit?(test_passage)
    test_passage.user.test_passages.passed.count == 1
  end

  def by_level?(test_passage)

  end

  def by_failed?(test_passage)

  end
end
