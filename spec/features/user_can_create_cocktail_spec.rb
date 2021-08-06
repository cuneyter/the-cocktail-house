require 'rails_helper'

# User login
# click 'Create a new Cocktail!'
# fill in cocktail name
# add image
# click 'Create a cocktail'
# Then should see 'created cocktail in the home page'

RSpec.feature 'User can create a cocktail feature', type: :feature do
  before do
    # FactoryBot.create(:user)
    User.create(first_name: 'Cuneyt', last_name: 'Ergun', email: 'cuneytergun@gmail.com', password: '1234567')
  end
  scenario 'User can create a cocktail' do
    visit root_path
    click_on 'Login to Create a Cocktail!'
    fill_in 'user_email', with: 'cuneytergun@gmail.com'
    fill_in 'user_password', with: '1234567'
    click_on 'Log in'
    click_on 'Create a new Cocktail!'
    fill_in 'cocktail_name', with: 'TEST COCKTAIL'
    attach_file 'cocktail_photo', '/home/user/Desktop/IMG_5533 (2)[622].jpg'
    click_on 'Create a cocktail'
    expect(page).to have_content('TEST COCKTAIL')
  end
end
