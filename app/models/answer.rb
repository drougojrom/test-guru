class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validate :validate_answers_count, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_count
    binding.pry
    if question.answers.count >= 4
      errors.add(:question, 'can not have more than 4 answers')
    end
  end
end
