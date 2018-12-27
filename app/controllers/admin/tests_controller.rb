class Admin::TestsController < Admin::BaseController

  before_action :set_test, only: %i[show edit update destroy update_inline]
  before_action :set_tests, only: %i[index update_inline]

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.authored_tests.new(test_parameters)
    if @test.save
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @test.update(test_parameters)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end
  
  def update_inline
    if @test.update(test_parameters)
      redirect_to admin_test_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def test_parameters
    params.require(:test).permit(:title, :level, :category_id, :timer_value)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def set_tests
    @tests = Test.all
  end
end
