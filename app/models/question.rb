class Question < ApplicationRecord
  belongs_to :test, counter_cache: true
  has_many :answers

  validates :body, presence: true
end
