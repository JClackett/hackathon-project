class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :doctor, :boolean	
  end
end
