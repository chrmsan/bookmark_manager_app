require 'spec_helper'

feature 'Viewing links' do

	scenario 'links are visible on the /links endpoint' do
		Link.new(url: 'http://www.google.com', title: 'Google Homepage')

		visit '/links'
		expect(page.status_code).to eq(200)

		within 'ul#links' do
			expect(page).to have_content('Makers Academy')
		end

	end

end