require "warden"
require "dynamic_form"
require "apartment"

module Subscribm
  class Engine < ::Rails::Engine
    isolate_namespace Subscribm
    
    config.generators do |g|
		g.test_framework :rspec, :view_specs => false
	end
	
	initializer "subscribm.middleware.warden" do
		Rails.application.config.middleware.use Warden::Manager do |manager|
			manager.default_strategies :password
			manager.serialize_into_session do |user|
				user.id
			end
			manager.serialize_from_session do |id|
				Subscribm::User.find(id)
			end
		end
	end
	
	config.to_prepare do
		root = Subscribm::Engine.root
		extenders_path = root + "app/extenders/**/*.rb"
		Dir.glob(extenders_path) do |file|
			Rails.configuration.cache_classes ? require(file) : load(file)
		end
	end
  end
  
  
end


