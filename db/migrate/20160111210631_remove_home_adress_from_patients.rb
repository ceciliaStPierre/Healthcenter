class RemoveHomeAdressFromPatients < ActiveRecord::Migration
  def change
    change_table :patients do |t|
      t.remove :home_adress
      
    end
  end
end
