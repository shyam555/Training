class RemoveColummnCategory < ActiveRecord::Migration
  def change
    remove_column :categories, :parent_id
  end
end
