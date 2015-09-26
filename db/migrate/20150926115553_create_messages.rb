class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :doctor_id
      t.integer :patient_id
      t.text :content

      t.timestamps null: false
    end
  end
end
