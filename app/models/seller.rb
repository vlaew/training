class Seller < User
  has_many :products, dependent: :destroy

  def seller?
    true
  end

  def full_name
    self.shop_name
  end
end
