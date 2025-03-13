require 'rails_helper'

describe "User can login to chat app", type: :system do
    context "user exists" do
        before do
          create(:user)
          create(:room, name: "General")
        end
        
        it "allows user to login" do
            user_goes_to_login_page
            user_enters_email_and_password
            user_clicks_login_button
            user_should_see_chatroom_page
        end

        it "allows user to create a room" do
            user_goes_to_login_page
            user_enters_email_and_password
            user_clicks_login_button
            user_should_create_room
        end
    end

    it "does not allow anonymous user to use the app" do
        # visit root_path
        # expect(page).to have_current_path(new_user_session_path)
    end

    it "checks user's email and password" do
        # user_goes_to_login_page
        # fill_in 'Email', with: 'user@example.com'
        # fill_in 'Password', with: 'password'
        # save_and_open_page 
    end

    def user_goes_to_login_page
        visit '/users/sign_in'
    end

    def user_enters_email_and_password
        fill_in 'Email', with: 'test@example.com'
        fill_in 'Password', with: 'password'
    end

    def user_clicks_login_button
        click_button 'Log in'
        expect(page).not_to have_content 'Log in'
    end

    def user_should_see_chatroom_page
        expect(page).to have_content 'General' 
    end

    def user_should_create_room
        visit '/rooms'
        fill_in 'Name', with: 'General2'
        click_button 'Create Room'
        expect(page).to have_content 'General2' 
    end
end 