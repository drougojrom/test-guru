class Admin < User
  validates :first_name, presence: true
  validates :last_Name, presence: true
end
