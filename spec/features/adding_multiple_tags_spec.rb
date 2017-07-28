feature 'FEATURE: adding multiple tags to a link' do
  scenario 'for newly created link' do
    register_user
    add_link('Google', 'google.com', 'search, cool, bye personal data')
    expect(page).to have_content('Google (google.com). Tags: search; cool; bye personal data;')
  end
end
