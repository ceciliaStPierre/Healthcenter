module PatientsHelper
	def FamilyGroups(family_groups)
		family_groups.map {|f| link_to f.family_name, family_group_path(f)}.join(', ').html_safe
	end

	def DiseaseDisplay(disease)
		return ("<p>- "+disease+"</p>").html_safe
	end
end
