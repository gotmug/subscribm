require 'rails_helper'

describe Subscribm::AccountsController do
	context "creates the account's schema" do
		let!(:account) { Subscribm::Account.new }
		before do
			expect(Subscribm::Account).to receive(:create_with_owner).
				and_return(account)
			allow(account).to receive(:valid?).and_return(true)
			allow(controller).to receive(:force_authentication!).and_return(true)
		end
		specify do
			expect(account).to receive(:create_schema)
			post :create, :account => { :name => "First Account" },
				:use_route => :subscribm
		end
	end
end
