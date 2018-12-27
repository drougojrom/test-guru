class AddStatusToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :status, :integer, null: false, default: 1
  end
end
