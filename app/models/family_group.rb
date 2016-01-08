class FamilyGroup < ActiveRecord::Base
	has_many :plans
	has_many :patients, through: :family_groups_patients
	has_many :family_groups_patients

	default_scope :order => 'created_at ASC'
end
