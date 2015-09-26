class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :shop_name, null: false
    end
  end
end
