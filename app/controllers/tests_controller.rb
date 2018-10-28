class TestsController < ApplicationController
  def index
  end

  def show
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
