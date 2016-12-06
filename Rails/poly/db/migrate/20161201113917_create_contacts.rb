class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :contactable, polymorphic: true, index: true
      t.string :add
      t.string :mob_num

      t.timestamps null: false
    end
  end
end
