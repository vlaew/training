class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, password_length: 6..128

  mount_uploader :avatar_image, SimpleImageUploader
  mount_uploader :passport_image, SimpleImageUploader

  def admin?
    false
  end

  def seller?
    false
  end

  def guest?
    false
  end

  def full_name
    email
  end
end
