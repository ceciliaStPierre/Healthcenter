class Activity < ActiveRecord::Base
	validates :activity_type, :inclusion => { :in => ACTIVITY_TYPE}
	belongs_to :plan
	has_many :activities_users
	has_many :users, through: :activities_users
	has_many :objectives, :dependent => :destroy

	default_scope :order => 'created_at ASC'
end
