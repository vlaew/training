class AddRoleableRelationToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.belongs_to :roleable, polymorphic: true, index: true
    end
  end
end
