class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
    end
  end
end
