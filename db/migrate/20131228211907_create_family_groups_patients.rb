class CreateFamilyGroupsPatients < ActiveRecord::Migration
  	def change
		create_table :family_groups_patients, id: false do |t|
			t.references :family_group
			t.references :patient
		end

		add_index :family_groups_patients, [:family_group_id, :patient_id], unique: true
	end
end
