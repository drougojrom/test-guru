class AddResponsesToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :responses, :question, index: true, foreign_key: true
  end
end
