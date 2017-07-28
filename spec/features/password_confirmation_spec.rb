feature 'FEATURE: password confirmation' do
  scenario 'fills in a mismatching confirmation password' do
    visit('/users/new')
    register_user('dave@dave.dv','1234dave', 'dave')
    expect(User.all.count).to eq 0
  end
end
