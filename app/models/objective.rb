class Objective < ActiveRecord::Base
	belongs_to :activity

	default_scope :order => 'created_at ASC'
end
