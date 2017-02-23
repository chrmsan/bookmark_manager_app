require 'spec_helper'

feature 'Adding tags' do

	scenario 'Adding a tag to a new link' do
		visit '/links/new'
		fill_in 'title', with: 'A Pokemon Site'
		fill_in 'url', with: 'http://www.pokemon.com/'
		fill_in 'tags', with: 'pikachu'

		click_button 'Add Link'
		link = Link.first #it aquires the the first instance in the Link database
		expect(link.tags.map(&:name)).to include('education')

	end


end