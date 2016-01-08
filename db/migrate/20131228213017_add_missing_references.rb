class AddMissingReferences < ActiveRecord::Migration
  def change
  	add_reference :activities, :plan, index: true
  	add_reference :plans, :user, index: true
  	add_reference :plans, :family_group, index: true
  end
end
