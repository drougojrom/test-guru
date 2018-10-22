class AddResponsesToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :responses, :question, index: true
  end
end
