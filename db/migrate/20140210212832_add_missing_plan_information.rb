class AddMissingPlanInformation < ActiveRecord::Migration
  def change
  	add_column :plans, :risk_details, :text, :default => ""
  	add_column :plans, :protection_details, :text, :default => ""
  end
end
