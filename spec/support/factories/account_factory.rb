FactoryGirl.define do
	factory :account, :class => Subscribm::Account do
		sequence(:name) { |n| "Test Account ##{n}" }
		sequence(:subdomain) { |n| "test#{n}" }
		association :owner, :factory => :user
		after(:create) do |account|
			account.users << account.owner
		end
	end
end
