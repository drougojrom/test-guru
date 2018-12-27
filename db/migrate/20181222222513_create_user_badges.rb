class CreateUserBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :user_badges do |t|
      t.belongs_to :badge, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
