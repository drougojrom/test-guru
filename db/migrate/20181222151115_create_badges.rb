class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image
      t.integer :rule_id

      t.timestamps
    end
    add_index :badges, :name
  end
end
