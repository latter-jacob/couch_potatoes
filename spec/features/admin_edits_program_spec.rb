require 'rails_helper'

feature 'admin edits program', %{
  As an admin
  I want to be able to edit a program
} do

  # [] Admins are able to verify their credentials
  # [X] Without veriried credentials admin login fails
  # [X] Admins are able to visit the edit program page
  # [X] Non admins are redirected when attempting to visit the page
  # [X] Admins are able to successfully edit a show
  # [X] With invalid form info, admins are not able to edit a new show
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

  scenario 'admin edits program successfully' do
    admin = FactoryGirl.create(:admin)
    program = FactoryGirl.create(:program, title: "Friends")

    visit new_admin_session_path
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

  scenario 'admin edits program unsuccessfully' do
    admin = FactoryGirl.create(:admin)
    program = FactoryGirl.create(:program, title: "Friends")

    visit new_admin_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully')

    visit edit_program_path(program)

    fill_in 'Title', with: ""

    click_button "Edit Program"
    expect(page).to have_content("Title can't be blank")
  end

  scenario 'user tries to visit edit program page' do
    user = FactoryGirl.create(:user)
    program = FactoryGirl.create(:program)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully')

    visit edit_program_path(program)

    expect(page).to have_content("This portion of the site is for admins only!")
  end

  scenario 'admin is able to navigate to edit page from show page' do
    admin = FactoryGirl.create(:admin)
    program = FactoryGirl.create(:program)

    visit new_admin_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully')

    visit program_path(program)

    click_link('Edit')

    expect(page).to have_content("Edit #{program.title}")

  end
end
