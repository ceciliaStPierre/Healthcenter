class CreateActivitiesUsers < ActiveRecord::Migration
  	def change
		create_table :activities_users, id: false do |t|
			t.references :activity
			t.references :user
		end

		add_index :activities_users, [:activity_id, :user_id], unique: true
	end
end
