require 'spec_helper'

describe User do

	let!(:user) do
		User.create(email: "mickey@mouse.come", password: "1234", password_confirmation: "1234")
	end

	it "authenticates when given a valid/existing email and password" do
		authenticated_user = User.authenticate(user.email, user.password) #.authenticate is Bcrypt method?
		expect(authenticated_user).to eq user
	end

end