feature 'FEATURE: filtering links by tag' do
  scenario 'filtering links by tag: bubbles' do
    register_user('dave@dave.dv','1234dave', '1234dave')
    add_link('GoogleBubbles', 'googlebubbles.com', 'bubbles')
    add_link('Bubbles', 'bubbles.com', 'bubbles')
    add_link('NOTBubbles', 'nononobubbles.com', 'game')
    visit('/tags/bubbles')
    expect(page).to have_content "GoogleBubbles (googlebubbles.com)"
  end
end
