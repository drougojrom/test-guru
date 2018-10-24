class ChangeResponseToAnswer < ActiveRecord::Migration[5.2]
  def change
    rename_column :responses, :response, :answer
  end
end
