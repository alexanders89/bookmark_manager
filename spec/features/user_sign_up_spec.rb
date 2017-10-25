feature 'User sign in' do
  scenario 'user can sign in to view just their links' do
    visit '/'
    fill_in 'username',   with: 'owliver@owlmail.com'
    fill_in 'password', with: '1234'
    click_button 'Login'
    expect(page).to have_content "Welcome owliver@owlmail.com"
  end
end
