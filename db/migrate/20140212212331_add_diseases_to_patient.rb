class AddDiseasesToPatient < ActiveRecord::Migration
  def change
  	add_column :patients, :diseases, :text, :default => ""
  end
end
