class Question < ApplicationRecord
  belongs_to :test, counter_cache: true
  has_many :test_passages, dependent: :nullify
  has_many :answers
  has_many :gists

  validates :body, presence: true
end
