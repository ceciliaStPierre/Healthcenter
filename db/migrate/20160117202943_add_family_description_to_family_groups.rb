class AddFamilyDescriptionToFamilyGroups < ActiveRecord::Migration
  def change
    add_column :family_groups, :family_description, :string
  end
end
