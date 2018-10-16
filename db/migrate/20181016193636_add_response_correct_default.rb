class AddResponseCorrectDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :responses, :correct, false
  end
end
