class RemovePlanType < ActiveRecord::Migration
  def change
  	remove_column :plans, :plan_type
  end
end
