
feature 'viewing links' do
  scenario 'so i can see existing links on the links page' do
    Link.create(url: "http:bbc.co.uk/news", title: "News")
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('News')
    end
  end
end
