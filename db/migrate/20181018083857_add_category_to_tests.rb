class AddCategoryToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :category, foreign_key: true
    change_column :tests, :category_id, :integer, null: false    
  end
end
