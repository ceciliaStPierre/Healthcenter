class RemoveContactNumberFromPatients < ActiveRecord::Migration
  def change
    change_table :patients do |t|
      t.remove :contact_number
      
    end
  end
end
