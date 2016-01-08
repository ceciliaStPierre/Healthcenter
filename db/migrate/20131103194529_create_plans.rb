class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.text :family_objective
      t.text :clinical_objective
      t.string :risk_factor
      t.string :state
      t.string :plan_type
      t.text :close_reason
      t.datetime :close_datetime
      t.timestamps
    end
  end
end
