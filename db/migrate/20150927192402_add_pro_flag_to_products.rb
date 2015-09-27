class AddProFlagToProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.boolean :pro, default: false, null: false
    end
  end
end
