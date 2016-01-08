class AddPasswordchangeToUser < ActiveRecord::Migration
  def change
  	add_column :users, :updating_password, :boolean, :default => false
  end
end
