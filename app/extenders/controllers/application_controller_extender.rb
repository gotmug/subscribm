::ApplicationController.class_eval do
	def authenticate_user!
		unless user_signed_in?
			flash[:notice] = "Please sign in."
			redirect_to "/sign_in"
		end
	end
  
	def current_account
		@current_account ||= env["X-Houser-Object"]
	end
	
	helper_method :current_account
	
	def current_user
		if user_signed_in?
			@current_user ||= begin
				user_id = env["warden"].user(:scope => :user)
				Subscribm::User.find(user_id)
			end
		end
	end
	
	helper_method :current_user
	
	def user_signed_in?
		env["warden"].authenticated?(:user)
	end
	
	helper_method :user_signed_in?
	
	def force_authentication!(user)
		env["warden"].set_user(user, :scope => :user)
	end
end
