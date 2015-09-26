class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :doctor_id
      t.integer :patient_id
      t.string :status
      t.binary :raw_data
      t.text :notes

      t.timestamps null: false
    end
  end
end
