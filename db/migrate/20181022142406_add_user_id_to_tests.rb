class AddUserIdToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :user, index: true, foreign_key: true
    change_column :tests, :user_id, :integer, null: false        
  end
end
