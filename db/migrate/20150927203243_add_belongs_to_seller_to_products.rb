class AddBelongsToSellerToProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.belongs_to :seller, index: true
    end
  end
end
