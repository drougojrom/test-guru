class AddQuestionsToTest < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :test, index: true, foreign_key: true
    change_column :questions, :test_id, :integer, null: false        
  end
end
