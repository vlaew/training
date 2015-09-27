class Admin < ActiveRecord::Base
  mount_uploader :avatar_image, SimpleImageUploader
  mount_uploader :passport_image, SimpleImageUploader

  has_one :user, as: :roleable
  accepts_nested_attributes_for :user
  delegate :email, :password, to: :user, allow_nil: true

  devise :registerable#, :validatable, password_length: 10..128

  validate :password_length
  validates :first_name, :last_name, :avatar_image, :passport_image, :birthdate,
            presence: true

  def method_missing(method, *args, &block)
    return self.user.send(method, *args) if self.user.respond_to?(method)
    super
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def password_length
    if user.present? && user.password.length < 10
      errors.add(:user, 'Password is too short (minimum 10 symbols)')
    end
  end
end
