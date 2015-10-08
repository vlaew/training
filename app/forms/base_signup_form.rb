require 'abstract_type'

class BaseSignupForm
  include AbstractType

  include ActiveModel::Model
  include Virtus.model

  attr_reader :user

  attribute :email, String
  attribute :password, String
  attribute :password_confirmation, String


  validates :email, :password, :password_confirmation, presence: true
  validates_format_of :email, with: Devise.email_regexp
  validates_confirmation_of :password
  validates :password, length: { minimum: 6 }
  validate :email_uniqueness

  abstract_method :persist!

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private

  def email_uniqueness
    if User.find_by(email: email)
      errors.add(:email, 'Email is already taken')
    end
  end
end
