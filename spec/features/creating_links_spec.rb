feature 'creating links' do
  scenario 'user can create a link' do
    visit '/links'
    click_button 'Add Link'
    expect(page).to have_content 'Fill in info then click add'
    fill_in :url , with: 'my new url'
    fill_in :title , with: 'Title'
    click_button 'Add'
    expect(page).to have_content 'my new url'
  end
end
