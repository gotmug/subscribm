require_dependency "subscribm/application_controller"

module Subscribm
  class Account::UsersController < ApplicationController
	def new 
		@user = Subscribm::User.new
	end
	def create
		account = Subscribm::Account.find_by!(:subdomain => request.subdomain)
		user = account.users.create(user_params)
		force_authentication!(account, user)
		flash[:success] = "You have signed up successfully."
		redirect_to root_path
	end
	private
		def user_params
			params.require(:user).permit(:email, :password, :password_confirmation)
		end
  end
end