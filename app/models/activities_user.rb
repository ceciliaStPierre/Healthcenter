class ActivitiesUser < ActiveRecord::Base
	belongs_to :activity
	belongs_to :user

	#default_scope :order => 'created_at ASC'
end
