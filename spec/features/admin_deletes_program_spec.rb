require 'rails_helper'

feature 'admin deletes a program', %{
  As an admin
  I want to be able to delete a program
} do

  # [ ] Admins are able to verify their credentials
  # [ ] Without veriried credentials admin login fails
  # [ ] Admins are able to successfully delete a show
  scenario 'specify valid credentials' do
    admin = FactoryGirl.create(:user, admin: true)

    visit new_user_session_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
  end

  scenario 'specify invalid credentials' do
    visit new_user_session_path

    click_button 'Log in'
    expect(page).to have_content('Invalid email or password')
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'admin edits program successfully' do
    admin = FactoryGirl.create(:user, admin: true)
    program = FactoryGirl.create(:program, title: "Friends")

    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully')

    visit edit_program_path(program)

    fill_in 'Title', with: "Scrubs"

    click_button "Edit Program"

    expect(page).to have_content('Scrubs')
    expect(page).to have_content('Program edited')
  end

  scenario 'admin deletes program successfully' do
    admin = FactoryGirl.create(:user, admin: true)
    program = FactoryGirl.create(:program)

    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully')

    visit program_path(program)

    click_link "Delete Program"
    expect(page).not_to have_content("program.title")
  end
end
