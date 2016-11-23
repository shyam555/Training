class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
