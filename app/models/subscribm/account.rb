EXCLUDED_SUBDOMAINS = %w(admin)

module Subscribm
  class Account < ActiveRecord::Base
	has_many :members, :class_name => "Subscribm::Member"
	has_many :users, :through => :members
	validates_exclusion_of :subdomain, :in => EXCLUDED_SUBDOMAINS,
		:message => "is not allowed. Please choose another subdomain."
	validates_format_of :subdomain, :with => /\A[\w\-]+\Z/i,
		:message => "is not allowed. Please choose another subdomain."
	validates :subdomain, :presence => true, :uniqueness => true
	belongs_to :owner, :class_name => "Subscribm::User"
	accepts_nested_attributes_for :owner
	
	before_validation do
		self.subdomain = subdomain.to_s.downcase
	end
	
	def self.create_with_owner(params={})
		account = new(params)
		if account.save
			account.users << account.owner
		end
		account
	end
	
	def create_schema
		Apartment::Tenant.create(subdomain)
	end
	
  end
end
