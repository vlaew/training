class Guest < ActiveRecord::Base
  has_one :user, as: :roleable
  accepts_nested_attributes_for :user
  delegate :email, :password, to: :user, allow_nil: true

  devise :registerable#, :validatable, password_length: 10..128

  validate :password_length

  def method_missing(method, *args, &block)
    return self.user.send(method, *args) if self.user.respond_to?(method)
    super
  end

  def full_name
    self.user.email
  end

  private

  def password_length
    if user.present? && user.password.length < 6
      errors.add(:user, 'Password is too short (minimum 6 symbols)')
    end
  end
end
