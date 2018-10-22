class AddQuestionsToTest < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :test, index: true
  end
end
