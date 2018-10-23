class AddResponsesToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :responses, :question, index: true, foreign_key: true
    change_column :responses, :question_id, :integer, null: false        
  end
end
