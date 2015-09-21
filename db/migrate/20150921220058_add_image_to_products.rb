class AddImageToProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.string :image
    end
  end
end
