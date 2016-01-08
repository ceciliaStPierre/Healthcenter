module FamilyGroupsHelper

	def FamilyMembers(patients)
		patients.map {|p| link_to p.firstname + " "+p.father_lastname , patient_path(p)}.join(', ').html_safe
	end
end
