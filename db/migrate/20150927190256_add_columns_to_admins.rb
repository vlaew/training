class AddColumnsToAdmins < ActiveRecord::Migration
  def change
    change_table :admins do |t|
      t.string :avatar_image
      t.string :passport_image
      t.date :birthdate
    end
  end
end
