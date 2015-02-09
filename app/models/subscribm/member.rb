module Subscribm
  class Member < ActiveRecord::Base
	belongs_to :account, :class_name => "Subscribm::Account"
	belongs_to :user, :class_name => "Subscribm::User"
  end
end
