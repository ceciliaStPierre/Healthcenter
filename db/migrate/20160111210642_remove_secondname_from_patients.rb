class RemoveSecondnameFromPatients < ActiveRecord::Migration
  def change
    change_table :patients do |t|
      t.remove :secondname
      
    end

  end
end
