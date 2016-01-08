class ChangeFamilyobjectiveToFamilysummaryInPlan < ActiveRecord::Migration
  def change
  	rename_column :plans, :family_objective, :family_summary
  end
end
