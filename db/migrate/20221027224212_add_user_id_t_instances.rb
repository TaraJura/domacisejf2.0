class AddUserIdTInstances < ActiveRecord::Migration[7.0]
  def change
    add_column :instances, :user_id, :integer
  end
end
