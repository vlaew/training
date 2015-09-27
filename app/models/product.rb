class Product < ActiveRecord::Base
  mount_uploader :image, SimpleImageUploader
  belongs_to :seller

  delegate :shop_name, to: :seller, allow_nil: true
end
