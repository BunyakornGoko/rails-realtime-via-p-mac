require 'rails_helper'

describe "User can create a room", type: :system do
    it "allows user to create a room" do
        user_enters_rooms_page
        user_create_a_room
        user_should_see_new_room
    end

    def user_enters_rooms_page
        visit 'rooms'
    end

    def user_create_a_room
        fill_in 'Room', with: 'New Room'  # Update to match the actual label
        click_button 'Create Room'  # Click the button to create the room
    end

    def user_should_see_new_room
        expect(page).to have_content('New Room')  # Check that the new room name is displayed
    end
end