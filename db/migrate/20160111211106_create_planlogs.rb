class CreatePlanlogs < ActiveRecord::Migration
  def change
    create_table :planlogs do |t|
      t.integer :user_id
      t.integer :family_group_id
      t.integer :activity_id
      t.datetime :timestamp
    end
  end
end
