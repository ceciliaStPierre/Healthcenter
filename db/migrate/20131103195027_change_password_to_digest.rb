class ChangePasswordToDigest < ActiveRecord::Migration
  def up
  	rename_column :users, :password, :password_digest
  	User.reset_column_information
	  require 'bcrypt'
    User.all.each do |u|
      u.password = u.password_digest
      u.password_confirmation = u.password
      u.save
    end
  end
end
