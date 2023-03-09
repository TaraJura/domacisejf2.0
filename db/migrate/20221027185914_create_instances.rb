class CreateInstances < ActiveRecord::Migration[7.0]
  def change
    create_table :instances do |t|
      t.string :name

      t.timestamps
    end
  end
end
