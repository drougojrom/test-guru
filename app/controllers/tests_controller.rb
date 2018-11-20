class TestsController < ApplicationController

  before_action :authenticate_user!

  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])
    @user = current_user
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end
end
