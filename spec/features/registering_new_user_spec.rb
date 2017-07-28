feature 'FEATURE: registering a new user' do
  scenario 'signing up dave' do
    register_user
    expect(page).to have_current_path('/links')
    expect(page).to have_content "WELCOME dave@dave.dv"
    expect(User.all.count).to eq 1
  end
end
