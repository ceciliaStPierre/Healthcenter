class CreateFamilyGroups < ActiveRecord::Migration
  def change
    create_table :family_groups do |t|
      t.string :family_name

      t.timestamps
    end
  end
end
