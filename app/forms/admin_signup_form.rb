class AdminSignupForm < BaseSignupForm
  attribute :first_name, String
  attribute :last_name, String
  attribute :birthdate, Date
  attribute :avatar_image, String
  attribute :passport_image, String

  validates :first_name, :last_name, #:birthdate,
            :avatar_image, :passport_image, presence: true
  validates :password, length: { minimum: 10 }

  private

  def persist!
    @user = Admin.create!(attributes)
  end
end
