class QuestionsController < ApplicationController

  before_action :authenticate_user!  
  before_action :find_question, only: [:show, :destroy]
  before_action :find_test, only: [:index, :new, :create]

  rescue_from ActiveRecord::RecordNotFound,
    with: :rescue_question_not_found

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @test.questions.create(question_params)
    redirect_to admin_test_url(@test)
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
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
