

feature 'Viewing links' do
  before { DatabaseCleaner.strategy = :truncation }
  after { DatabaseCleaner.clean }

  scenario 'I can see all the links at the links page' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit('/links')
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
