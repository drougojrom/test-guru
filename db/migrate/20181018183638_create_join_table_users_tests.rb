class CreateJoinTableUsersTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests_users do |t|
      t.belongs_to :test, index: true
      t.belongs_to :user, index: true
    end
  end
end
