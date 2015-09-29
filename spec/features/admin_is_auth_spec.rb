require 'rails_helper'

feature 'Users signs in ', %{
  As an user i want to see my status
} do

  # [x] Admins are able to verify their credentials
  # [x] Users are able to verify their credentials
  # [x] Without veriried credentials admin login fails

  scenario 'specify valid credentials' do
    admin = FactoryGirl.create(:user, admin: true)

    visit new_user_session_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Admin')
  end

  scenario 'specify valid credentials' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
  end

  scenario 'specify invalid credentials' do
    visit new_user_session_path

    click_button 'Log in'

    expect(page).to have_content('Invalid email or password')
    expect(page).to_not have_content('Sign Out')
  end
end
