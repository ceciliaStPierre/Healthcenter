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
	def RiskFactorColor(plan)
		if plan.risk_factor == "Alto"
			#rojo
			return "<span class='glyphicon glyphicon-warning-sign' style='color:red'></span>".html_safe
		elsif plan.risk_factor == "Moderado"
			#amarillo
			return "<span class='glyphicon glyphicon-warning-sign' style='color:yellow'></span>".html_safe

		elsif plan.risk_factor == "Bajo"
			#verde
			return "<span class='glyphicon glyphicon-warning-sign' style='color:green'></span>".html_safe

		else
			return "<span class='glyphicon glyphicon-warning-sign' style='color:black'></span>".html_safe

			#negro
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
