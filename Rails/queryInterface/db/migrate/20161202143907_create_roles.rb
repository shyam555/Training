class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
    	t.string :role_one
    	t.string :role_two

      t.timestamps null: false
    end
  end
end
