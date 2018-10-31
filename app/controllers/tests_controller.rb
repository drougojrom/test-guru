class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def new
  end

  def create
    test = Test.create(test_parameters)
    render plain: test.inspect
  end

  private

  def test_parameters
    params.require(:test).permit(:title, :level)
  end
end
