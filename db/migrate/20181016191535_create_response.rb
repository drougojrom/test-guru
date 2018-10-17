class CreateResponse < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.text :response

      t.timestamps
    end
  end
end
