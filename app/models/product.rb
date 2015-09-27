class Product < ActiveRecord::Base
  mount_uploader :image, SimpleImageUploader
end
