feature 'Adding new link' do
  scenario 'Add a new link' do
    register_user
    add_link('Sasso Carta Forbici', 'https://sasso-carta-forbici.herokuapp.com', 'games')
    expect(page).to have_content('Sasso Carta Forbici (https://sasso-carta-forbici.herokuapp.com). Tags: games')
  end
end
