class AddTestsCorrectDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tests, :correct, false
  end
end
