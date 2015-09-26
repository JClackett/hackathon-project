class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.integer :user_id
      t.integer :doctors_id

      t.timestamps null: false
    end
  end
end
