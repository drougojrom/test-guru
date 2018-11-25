class ChangeAuthorForeignKey < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :author, references: :users, foreign_key: { to_table: :users }    
  end
end
