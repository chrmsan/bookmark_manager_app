require "spec_helper"

feature "User sign up" do

	scenario "I can sign up as a new user" do
		expect { sign_up }.to change(User, :count).by(1)
		expect(page).to have_content("Welcome, john@doe.com")
		expect(User.first.email).to eq("john@doe.com")
	end

	scenario "requires a matching confirmation password" do
		expect { sign_up(password_confirmation: "wrong") }.not_to change(User, :count)
		expect(current_path).to eq("/users")
		expect(page).to have_content("Password and confirmation does not match")
	end

	scenario "I can't sign up without an email address" do
		expect { sign_up(email: nil) }.not_to change(User, :count)
	end

end