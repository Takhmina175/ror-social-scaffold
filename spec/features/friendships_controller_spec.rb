require 'rails_helper'
RSpec.feature 'FriendshipsController', type: :feature do
  context 'Create friend' do
    before :each do
      @user = User.create(name: 'user', email: 'u@m', password: '123456', password_confirmation: '123456')
      @friend = User.create(name: 'friend', email: 'f@m', password: '123456', password_confirmation: '123456')
      visit new_user_session_path
      within('form') do
        fill_in 'Email', with: 'u@m'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      click_link 'All users'
      click_link 'Add friend'
    end

    scenario 'request friend' do
      expect(page).to have_content('Friend request sent')
      expect(page).to have_link('Delete friend')
      expect(page).to have_button('requested')
    end

    scenario 'delete requested friend' do
      click_link 'Delete friend'
      expect(page).to have_content('Friendship with friend deleted')
      click_link 'All users'
      expect(page).to have_no_link('Delete Friend')
      expect(page).to have_no_button('requested')
      expect(page).to have_link('Add friend')
    end

    scenario 'update friendship' do
      click_link 'Sign out'
      within('form') do
        fill_in 'Email', with: 'f@m'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      visit users_path(id: '2')
      expect(page).to have_button('pending')
      expect(page).to have_link('Delete')
      expect(page).to have_link('Accept')
      click_link 'Accept'
      expect(page).to have_content('Friendship with user accepted')
      visit users_path(id: '2')
      expect(page).to have_no_button('pending')
      expect(page).to have_link('Delete')
      expect(page).to have_no_link('Accept')
      expect(page).to have_button('accepted')
    end

    scenario 'Destroy friendship' do
      click_link 'Sign out'
      within('form') do
        fill_in 'Email', with: 'f@m'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      visit users_path(id: '2')
      expect(page).to have_button('pending')
      expect(page).to have_link('Delete')
      expect(page).to have_link('Accept')
      click_link 'Delete'
      expect(page).to have_content('Friendship with user deleted')
      visit users_path(id: '2')
      expect(page).to have_no_button('pending')
      expect(page).to have_no_link('Delete')
      expect(page).to have_no_link('Accept')
      expect(page).to have_no_button('accepted')
    end
  end
end
