feature 'testing infrastructure' do
  scenario 'everything working OK' do
    visit '/testing'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Testing Infrastructure OK')
    end
  end
