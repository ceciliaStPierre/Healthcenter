class User < ActiveRecord::Base
	has_many :plans
	has_many :activities_users
	has_many :activities, through: :activities_users

	acts_as_messageable

	has_secure_password
	has_attached_file :avatar, :styles => { :medium => "300x300", :small => "200x200>", :thumb => "100x100>" }, :default_url => "missing.png"

	validates :firstname, presence: true
	validates :father_lastname, presence: true
	validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, uniqueness: true
	validates :password, confirmation: true,:if => :should_validate_password?, presence: true, :if => :should_validate_password?, length: { in: 8..50 }
	validates :password_confirmation, presence: true, :if => :should_validate_password?

	default_scope :order => 'created_at ASC'

	def fullname
		 "#{firstname} #{father_lastname}"
	end

	def should_validate_password?
	  updating_password || new_record?
	end

	def self.authenticate(email, password)
		User.find_by(email: email).try(:authenticate, password)
	end

	def name
	  return "none"
	end

	def mailboxer_email(object)
	  return nil
	end
end
