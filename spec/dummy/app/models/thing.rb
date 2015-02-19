class Thing < ActiveRecord::Base
	extend Subscribm::ScopedTo
	belongs_to :account, :class_name => "Subscribm::Account"
end
