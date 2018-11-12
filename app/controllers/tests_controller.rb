class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test, only: %i[show edit update destroy start]
  before_action :set_user, only: %i[start]

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.tests.new(test_parameters)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @test.update(test_parameters)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    @test = Test.find(params[:id])
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def test_parameters
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = current_user
  end
end
