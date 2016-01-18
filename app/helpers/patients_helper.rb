module PatientsHelper
	def FamilyGroups(family_groups)
		family_groups.map {|f| link_to (f.family_name.to_s+": "+f.family_description.to_s), family_group_path(f)}.join(', ').html_safe
	end

	def DiseaseDisplay(disease)
		return ("<p>- "+disease+"</p>").html_safe
	end
end
