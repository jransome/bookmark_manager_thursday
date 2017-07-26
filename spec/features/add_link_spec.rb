feature 'Adding new link' do
  scenario 'Add a new link' do
    visit('/links/new')
    fill_in 'title', with: 'Sasso Carta Forbici'
    fill_in 'url', with: 'https://sasso-carta-forbici.herokuapp.com'
    fill_in 'tags', with: 'games'
    click_button 'Submit'
    expect(page).to have_content('Sasso Carta Forbici')
    expect(page).to have_content('https://sasso-carta-forbici.herokuapp.com')
    expect(page).to have_content('games')
  end
end
