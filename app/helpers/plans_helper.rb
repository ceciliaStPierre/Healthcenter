module PlansHelper
	def PlanFamily(plan)
		family_group = plan.family_group
		return family_group.family_name.html_safe
	end

	def ActivityDiv(activity)
		today = Date.today
		if activity.is_done
			 return "<div class='board-item green-shadow'>".html_safe
		elsif activity.deadline < today
			return "<div class='board-item red-shadow'>".html_safe
		else
			return "<div class='board-item blue-shadow'>".html_safe
		end
	end

	def ObjectiveDisplay(objective)
		if objective.is_done
			return ("<input type='checkbox' disabled='disabled' checked> "+objective.description).html_safe
		else
			return ("<input type='checkbox' disabled='disabled'> "+objective.description).html_safe
		end
	end
end
