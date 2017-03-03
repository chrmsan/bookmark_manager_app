def sign_up
	visit '/users/new'
	expect(page.status_code).to ew(200)
	fill_in :email,		with: "john@doe.com"
	fill_in :password, with: "apples"
	click_button "Sign up"
end