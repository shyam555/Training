class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.belongs_to :client, index: true
    	t.integer :ord_no
    	t.datetime :ord_date
      t.timestamps null: false
    end
  end
end
