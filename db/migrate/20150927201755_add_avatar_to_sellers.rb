class AddAvatarToSellers < ActiveRecord::Migration
  def change
    change_table :sellers do |t|
      t.string :avatar_image
    end
  end
end
