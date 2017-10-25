def sign_up
  visit '/'
  fill_in 'username',   with: 'owliver@owlmail.com'
  fill_in 'password', with: '1234'
  click_button 'Login'
end
