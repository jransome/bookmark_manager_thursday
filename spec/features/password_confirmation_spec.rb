feature 'FEATURE: password confirmation' do
  scenario 'fails when filling in a mismatching confirmation password' do
    visit('/users/new')
    expect { register_user(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(page).to have_current_path('/users/new')
    expect(page).to have_content "Password and password confirmation fields don't match!"
  end
end
