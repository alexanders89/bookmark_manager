feature 'adding multiple tags' do
  scenario 'i can add multiple tags to a link' do
    visit '/new'
    fill_in 'url',   with: 'http://www.bbc.co.uk/weather/'
    fill_in 'title', with: 'BBC Weather'
    fill_in 'tags', with:  'weather rain'
    click_button 'Add'
    link = Link.first
    expect(link.tags.map(&:name)).to include('weather', 'rain')
  end
end
