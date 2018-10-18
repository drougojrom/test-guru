class Test < ApplicationRecord

  belongs_to :category

  def self.sorted_by_category(title)
    instances_by_category = Test.all.select { |instance| instance.category.title == title }
    instances_by_category.sort_by { |instance| instance.title.downcase }
  end
end
