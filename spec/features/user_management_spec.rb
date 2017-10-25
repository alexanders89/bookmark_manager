feature 'User sign up' do
  scenario 'User can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome owliver@owlmail.com')
    expect(User.first.username).to eq('owliver@owlmail.com')
  end
end
