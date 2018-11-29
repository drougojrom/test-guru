class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  has_many :gists

  before_validation :before_validation_set_first_question, on: :create
  after_validation :after_validation_set_next_question, on: :update

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end
  
  def completed?
    current_question.nil?
  end

  def result
    (correct_questions.to_f / test.questions.count.to_f) * 100
  end

  def current_question_number
    total_questions_count - remaining_questions.count
  end

  def total_questions_count
    test.questions.count
  end

  def success?
    result >= 85 ? "pos" : "neg"
  end

  private

  def after_validation_set_next_question
    self.current_question = next_question
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    correct_answers_count == correct_answers.where(id: answer_ids).count &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    @correct_answerts ||= current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def remaining_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end
end
