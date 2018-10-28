class QuestionsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound,
    with: rescue_question_not_found

  def index
  end

  def new
  end

  def show
  end

  def create
  end

  def destroy
  end

private

  def rescue_question_not_found
    render plain: 'Question not found'
  end
end
