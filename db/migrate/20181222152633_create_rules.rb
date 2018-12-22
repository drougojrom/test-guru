class CreateRules < ActiveRecord::Migration[5.2]
  def change
    create_table :rules do |t|
      t.string :name
      t.string :type
      t.integer :value, null: true

      t.timestamps
    end
  end
end
