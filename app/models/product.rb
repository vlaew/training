class Product < ActiveRecord::Base
  mount_uploader :image, SimpleImageUploader
  belongs_to :user

  delegate :shop_name, to: :user, allow_nil: true
end
