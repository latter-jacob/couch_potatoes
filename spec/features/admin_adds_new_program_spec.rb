require 'rails_helper'

feature 'admin adds program', %Q{
  As an admin
  I want to be able to add a program
} do

  # [X] Admins are able to verify their credentials
  # [X] Without veriried credentials admin login fails
  # [X] Admins are able to visit the create new program page
  # [X] Non admins are redirected when attempting to visit the page
  # [X] Admins are able to successfully create a new show
  # [X] With invalid form info, admins are not able to create a new show
  scenario 'specify valid credentials' do
    admin = FactoryGirl.create(:admin)

    visit new_admin_session_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
  end

  scenario 'specify invalid credentials' do
    visit new_admin_session_path

    click_button 'Log in'
    expect(page).to have_content('Invalid email or password')
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'admin adds program successfully' do
    admin = FactoryGirl.create(:admin)

    visit new_admin_session_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')

    visit new_program_path

    fill_in 'Title', with: "Scrubs"
    fill_in 'Url', with: "https://www.youtube.com/watch?v=JQfM2TVvBFU"
    fill_in 'Start Year', with: "2001"
    fill_in 'End Year', with: "2010"

    click_button "Add Program"

    expect(page).to have_content('Scrubs')
    expect(page).to have_content('2001')
    expect(page).to have_content('2010')
  end

  scenario 'admin adds program unsuccessfully' do
    admin = FactoryGirl.create(:admin)

    visit new_admin_session_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')

    visit new_program_path

    click_button "Add Program"
    expect(page).to have_content("Fill out form correctly")
  end

  scenario 'user tries to visit create program page' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    expect(page).to have_content('Signed in successfully')

    visit new_program_path

    expect(page).to have_content("Programs Home")
  end
end
