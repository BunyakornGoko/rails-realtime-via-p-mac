require 'rails_helper'

describe "User can login to chat app", type: :system do
    it "allows user to login" do
        user_goes_to_login_page
        user_enters_email_and_password
        user_clicks_login_button
        user_should_see_chatroom_page
    end

    it "does not allow anonymous user to use the app" do
        visit root_path
        expect(page).to have_current_path(new_user_session_path)
    end

    it "checks user's email and password" do
        user_goes_to_login_page
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
        save_and_open_page  # Fixed typo from 'screenshort'
    end

    def user_goes_to_login_page
        visit '/users/sign_in'
    end

    def user_enters_email_and_password
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
    end

    def user_clicks_login_button
        click_button 'Log in'
        expect(page).not_to have_content 'Log in'
        save_and_open_screenshot
    end

    def user_should_see_chatroom_page
        expect(page).to have_content 'Create room'
    end
end 