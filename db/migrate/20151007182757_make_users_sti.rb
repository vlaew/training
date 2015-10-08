class MakeUsersSti < ActiveRecord::Migration
  def change
    drop_table :admins
    drop_table :sellers
    drop_table :guests

    change_table :users do |t|
      t.string :type

      t.string :first_name
      t.string :last_name
      t.string :avatar_image
      t.string :passport_image
      t.date :birthdate

      t.string :shop_name
    end

    remove_belongs_to :products, :seller

    change_table :products do |t|
      t.belongs_to :user, index: true
    end
  end
end
