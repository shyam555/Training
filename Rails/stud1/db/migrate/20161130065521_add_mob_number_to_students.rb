class AddMobNumberToStudents < ActiveRecord::Migration
  def change
    add_column :students, :mob_number, :string
  end
end
