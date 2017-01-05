class AddPictureTostudents < ActiveRecord::Migration
  def change
    add_column :students, :picture, :string
  end
end
