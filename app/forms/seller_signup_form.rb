class SellerSignupForm < BaseSignupForm
  attribute :shop_name, String
  attribute :avatar_image, String

  validates :shop_name, :avatar_image, presence: true
  validates :password, length: { minimum: 8 }

  private

  def persist!
    @user = Seller.create!(attributes)
  end
end
