EXCLUDED_SUBDOMAINS = %w(admin)

module Subscribm
  class Account < ActiveRecord::Base
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
	
  end
end
