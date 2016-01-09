class FamilyGroupsPatient < ActiveRecord::Base
	belongs_to :patient
	belongs_to :family_group

	#default_scope :order => 'created_at ASC'
end
