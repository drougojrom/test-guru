class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true

  scope :correct, -> { where(correct: true) }
end
