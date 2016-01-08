class ModifyActivityInformation < ActiveRecord::Migration
  def change
  	rename_column :activities, :family_summary, :observations
  	remove_column :activities, :medical_summary
  end
end
