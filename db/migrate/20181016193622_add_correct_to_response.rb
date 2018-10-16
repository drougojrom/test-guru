class AddCorrectToResponse < ActiveRecord::Migration[5.2]
  def change
    add_column :responses, :correct, :boolean
  end
end
