class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    gist_service = GistQuestionService.new(@test_passage.current_question)
    gist_service.call
    @gist = current_user.gists.new(unique_hash: gist_service.result[:id],
                                   question: @test_passage.current_question)
    flash_options = if gist_service.success? && @gist.save
                      {notice: "#{t('.success')} #{gist_service.result['html_url']}"}
                    else
                      {alert: t('.failure') }
                    end
    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
