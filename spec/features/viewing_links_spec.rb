feature 'Viewing links' do
  scenario 'I can see all the links at the links page' do
    register_user
    add_link('Makers Academy', 'http://www.makersacademy.com', 'education')
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
