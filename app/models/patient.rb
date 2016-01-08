class Patient < ActiveRecord::Base
	has_many :family_groups, through: :family_groups_patients
	has_many :family_groups_patients

	default_scope :order => 'created_at ASC'

	def fullname
		 "#{firstname} #{father_lastname}"
	end
end
