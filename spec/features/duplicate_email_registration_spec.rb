feature 'FEATURE: cannot register same email address twice' do
  scenario 'attempting to register the same email address twice' do
    register_user(email: '123@fake.com')
    register_user(email: '123@fake.com')
    expect(page).to have_content "This email address is already registered!"
  end
end
