require 'spec_helper'

feature 'Submitting new links' do

	scenario 'A user adds new link and title' do
		visit '/links/new'
		fill_in 'title', with: 'A Pokemon Site'
		fill_in 'url', with: 'http://www.pokemon.com/'
		click_button 'Add Link'

		expect(current_path).to eq('/links')

		within 'ul#links' do
			expect(page).to have_content('A Pokemon Site')
		end

	end

end