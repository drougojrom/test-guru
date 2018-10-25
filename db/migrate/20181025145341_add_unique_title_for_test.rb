class AddUniqueTitleForTest < ActiveRecord::Migration[5.2]
  def change
    add_index :tests, :title, unique: true
  end
end
