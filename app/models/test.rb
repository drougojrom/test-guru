class Test < ApplicationRecord

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category
  has_and_belongs_to_many :users
  has_many :questions

  def self.sorted_by_category(title)
    Test.joins(:category).where(categories: {title: title }).order(title: :desc).pluck(:title)
  end
end
