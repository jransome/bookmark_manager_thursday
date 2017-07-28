def register_user
  visit('/')
  fill_in 'email', with: 'dave@dave.dv'
  fill_in 'password', with: '1234dave'
  click_button 'Register'
end

def add_link(title, url, tags)
  visit('/links/new')
  fill_in 'title', with: title
  fill_in 'url', with: url
  fill_in 'tags', with: tags
  click_button 'Submit'
end
