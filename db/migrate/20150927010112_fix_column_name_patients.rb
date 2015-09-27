class FixColumnNamePatients < ActiveRecord::Migration
  def change
  	rename_column :patients, :doctors_id, :doctor_id
  end
end
