require 'spec_helper'

feature "User signs out" do

	let!(:user) do
		User.create(email: "randomdude@random.com", password: "1234", password_confirmation: "1234")		
	end

	scenario "after first being signed in" do
		sign_in(email: user.email, password: user.password)
		click_button "Sign out"
		expect(page).to have_content("Ciao!")
		expect(page).not_to have_content("Welcome, #{user.email}") 
	end

end