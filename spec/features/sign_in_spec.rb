require "spec_helper"

feature "Sign in" do

	let!(:user) do
		User.create(email: "randomdude@random.com", password: "1234", password_confirmation: "1234")		
	end

	scenario "A user can sign in to an existing account" do
		sign_in(email: user.email, password: user.password)
		expect(page).to have_content("Welcome, #{user.email}")
	end


end