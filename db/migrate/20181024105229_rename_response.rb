class RenameResponse < ActiveRecord::Migration[5.2]
  def change
    rename_table :responses, :answers
    rename_column :answers, :answer, :text
  end
end
