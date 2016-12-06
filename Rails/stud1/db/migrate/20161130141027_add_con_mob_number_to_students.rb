class AddConMobNumberToStudents < ActiveRecord::Migration
  def change
    add_column :students, :con_mob_number, :string
  end
end
