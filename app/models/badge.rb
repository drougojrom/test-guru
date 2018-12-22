class Badge < ApplicationRecord
  has_many :users, through: :user_badge
  belongs_to :rule
  validates :name, presence: true

  def suitable?(test_passage)
    rule.passes?(test_passage)
  end
end
