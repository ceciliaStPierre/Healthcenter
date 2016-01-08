class Plan < ActiveRecord::Base
	validates :state, :inclusion => { :in => PLAN_STATE }
	validates :risk_factor, :inclusion => { :in => PLAN_RISK }

	belongs_to :user
	belongs_to :family_group
	has_many :activities
	has_many :family_groups

	default_scope :order => 'created_at ASC'
end
