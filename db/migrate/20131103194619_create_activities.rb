class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :description
      t.boolean :is_done, :default => false
      t.text :medical_summary
      t.text :family_summary
      t.string :activity_type
      t.date :deadline
      t.timestamps
    end
  end
end
