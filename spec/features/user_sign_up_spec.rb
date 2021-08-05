require 'rails_helper'

# visit the homepage as a visitor.
# click 'Login to create a cocktail'
# click 'Sign up'
# fill in first name, last name, email, password ( 7 characters min) and password confirmation fields
# click 'Sign up'
# Then should see 'Create a new cocktail' button.

RSpec.feature 'User signs up', type: :feature do
  scenario 'User can sign up' do
    visit root_path
    click_on 'Login to Create a Cocktail!'
    click_on 'Sign up'

    link_first_name = 'TEST-FIRST-NAME'
    link_last_name = 'TEST-LAST-NAME'
    link_email = 'test@example.org'
    link_password = '1234567'
    link_password_confirmation = '1234567'

    fill_in 'user_first_name', with: link_first_name
    fill_in 'user_last_name', with: link_last_name
    fill_in 'user_email', with: link_email
    fill_in 'user_password', with: link_password
    fill_in 'user_password_confirmation', with: link_password_confirmation

    click_on 'Sign up'

    expect(page).to have_content('My Cocktails')
  end

  scenario 'User sees password error message' do
    visit root_path
    click_on 'Login to Create a Cocktail!'
    click_on 'Sign up'

    link_first_name = 'TEST-FIRST-NAME'
    link_last_name = 'TEST-LAST-NAME'
    link_email = 'test@example.org'
    link_password = '1234567'
    link_password_confirmation = '123456'

    fill_in 'user_first_name', with: link_first_name
    fill_in 'user_last_name', with: link_last_name
    fill_in 'user_email', with: link_email
    fill_in 'user_password', with: link_password
    fill_in 'user_password_confirmation', with: link_password_confirmation

    click_on 'Sign up'

    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
