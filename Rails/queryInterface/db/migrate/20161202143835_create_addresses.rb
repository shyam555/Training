class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
    	t.belongs_to :client,index: true
    	t.string :add
    	t.string :mob_num

      t.timestamps null: false
    end
  end
end
