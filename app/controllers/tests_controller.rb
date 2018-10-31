class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_parameters)
    @test.author = User.first
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit
    @test = Test.find(params[:id])
  end

  def update
    @test = Test.find(params[:id])
    if @test.update(test_parameters)
      redirect_to @test
    else
      render :edit
    end
  end

  private

  def test_parameters
    params.require(:test).permit(:title, :level, :category_id)
  end
end
