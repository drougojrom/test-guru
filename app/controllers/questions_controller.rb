class QuestionsController < ApplicationController

  before_action :find_question, only: [:show, :destroy]
  before_action :find_test, only: [:index, :new, :create]

  rescue_from ActiveRecord::RecordNotFound,
    with: rescue_question_not_found

  def index
  end

  def new
  end

  def show
  end

  def create
    @test.questions.create(question_params)
    redirect_to test_questions_url
  end

  def destroy
    @question.destroy
    render plain: 'The question was removed from db'
  end

private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_question_not_found
    render plain: 'Question not found'
  end
end
