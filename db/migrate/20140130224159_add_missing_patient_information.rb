class AddMissingPatientInformation < ActiveRecord::Migration
  def change
  	add_column :patients, :risk_details, :text, :default => ""
  	add_column :patients, :protection_details, :text, :default => ""
  	add_column :patients, :risk_factor, :text, :default => ""
  end
end
