class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, password_length: 6..128

  belongs_to :roleable, polymorphic: true

  def admin?
    roleable.is_a? Admin
  end

  def seller?
    roleable.is_a? Seller
  end

  def guest?
    roleable.is_a? Guest
  end
end
