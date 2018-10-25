class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validate :body, presence: true
  validate :answers, length: { maximum: 4 }
end
