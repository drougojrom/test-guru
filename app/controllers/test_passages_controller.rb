class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]
  before_action :check_timeout, only: %i[show update]

  def show; end

  def result; end

  def update
    Timeout::timeout(@test_passage.test.timer_value.seconds) do
      @test_passage.accept!(params[:answer_ids])
      if @test_passage.completed?
        TestsMailer.completed_test(@test_passage).deliver_now
        @test_passage.add_badges
        redirect_to result_test_passage_path(@test_passage)
      else
        render :show
      end
    rescue Timeout::error
      check_timeout
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

  def check_timeout
    if @test_passage.timeout?
      flash[:danger] = "Time is up"
      redirect_to root_url
    end
  end
end
