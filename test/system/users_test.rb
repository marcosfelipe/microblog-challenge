require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test 'visit the login page' do
    visit new_user_session_url
    assert_selector "#email"
  end

  test 'login fails' do
    visit new_user_session_url
    fill_in 'E-mail', with: 'test'
    fill_in 'Password', with: 'test'
    click_button 'submit'
    assert_selector ".red--text", text: 'Invalid Email or password.'
  end

  test 'login redirects to home' do
    visit new_user_session_url
    user = users(:one)
    fill_in 'E-mail', with: user.email
    fill_in 'Password', with: 'test123'
    click_button 'submit'
    assert_selector '#username', text: user.username
  end
end
