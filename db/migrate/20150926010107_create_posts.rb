class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :patient_id
      t.string :location
      t.integer :discomfort
      t.string :frequency
      t.string :initial_occurence
      t.text :notes

      t.timestamps null: false
    end
  end
end
