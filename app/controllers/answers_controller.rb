class AnswersController < ApplicationController

  before_action :find_question, only: [:new, :create]
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @answer = @question.answers.new
  end

  def edit
  end

  def create
    @question.answers.create(answer_params)
    redirect_to question_url(@question)
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to @answer.question
  end

private
  def find_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:text, :correct, :question_id)
  end
end
