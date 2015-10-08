class GuestSignupForm < BaseSignupForm
  validates :password, length: { minimum: 6 }

  private

  def persist!
    @user = Guest.create!(attributes)
  end
end
