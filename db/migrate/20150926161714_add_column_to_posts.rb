class AddColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :doctor_id, :integer
  end
end
