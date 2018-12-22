require 'active_model'

class Contact

  include ActiveModel::Model

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessor :name, :email, :text

  validates :name, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :text, presence: true

  def initiazlie(contact)
    @name = contact[:name]
    @email = contact[:email]
    @text = contact[:text]
  end

end
