class AddCorrectToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :correct, :boolean
  end
end
