feature 'Adding tags' do

  scenario 'I can add a single tag to a new link' do
    visit '/new'
    fill_in 'url',   with: 'http://www.bbc.co.uk/weather/'
    fill_in 'title', with: 'BBC Weather'
    fill_in 'tags',  with: 'weather'

    click_button 'Add'
    link = Link.first
    expect(link.tags.map(&:name)).to include('weather')
  end

end
