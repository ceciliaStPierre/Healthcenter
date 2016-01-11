class RemovePhoneNumberFromPatients < ActiveRecord::Migration
  def change
    change_table :patients do |t|
      t.remove :phone_number
      
    end
  end
end
