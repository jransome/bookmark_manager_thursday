feature 'FEATURE: validating email address' do
  scenario "can't sign up without email" do
    expect { register_user(email:nil) }.not_to change(User, :count)
  end
  scenario "I can't sign up with an invalid email address" do
  expect { register_user(email: "invalid.email") }.not_to change(User, :count)
end
end
