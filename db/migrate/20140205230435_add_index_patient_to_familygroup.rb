class AddIndexPatientToFamilygroup < ActiveRecord::Migration
  def change
  	add_column :family_groups, :index_patient_id, :integer, :default => nil
  end
end
