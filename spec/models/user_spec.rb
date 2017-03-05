require 'spec_helper'

describe User do

	let!(:user) do
		User.create(email: "mickey@mouse.come", password: "1234", password_confirmation: "1234")
	end

	it "authenticates when given a valid/existing email and password" do
		authenticated_user = User.authenticate(user.email, user.password) #.authenticate is Bcrypt method?
		expect(authenticated_user).to eq user
	end

	it "does authenticates when given a  wrong password" do
		expect(User.authenticate(user.email, "wrong password")).to be_nil
	end

end