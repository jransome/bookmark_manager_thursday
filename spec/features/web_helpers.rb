def register_user(email, password, password_confirmation)
  visit('/users/new')
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Register'
end

def add_link(title, url, tags)
  visit('/links/new')
  fill_in 'title', with: title
  fill_in 'url', with: url
  fill_in 'tags', with: tags
  click_button 'Submit'
end
