class AddMissingUserInformation < ActiveRecord::Migration
  def change
  	add_column :users, :program, :string, :default => ""
  	add_column :users, :sector, :string, :default => ""
  end
end
