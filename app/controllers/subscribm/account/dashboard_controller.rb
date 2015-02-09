require_dependency "subscribm/application_controller"

module Subscribm
  class Account::DashboardController < ApplicationController
	before_filter :authenticate_user!
	
  end
end
