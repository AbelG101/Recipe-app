require 'rails_helper'

RSpec.describe 'foods', type: :feature do
  describe 'Tesing the creation of food' do
    before :each do
      @user1 = User.create(name: 'Betse', email: 'user@example.com', password: 'password', confirmed_at: Time.now)
      @food1 = @user1.foods.create(name: 'Potato', measurement_unit: 'kg', quantity: 4, price: 2, user_id: @user1)
      visit new_user_session_path
      within('body') do
        fill_in '@email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Login'
      sleep 3
      visit foods_path
    end

    it 'renders page correctly' do
      expect(page).to have_http_status :ok
    end

    it 'shows food' do
      expect(page).to have_content('Potato')
    end

    it 'shows food quantity' do
      expect(page).to have_content('4')
    end

    it 'shows foods price' do
      expect(page).to have_content('$2')
    end

    it 'shows foods measurement unit' do
      expect(page).to have_content('kg')
    end

    it 'shows button to add new food' do
      expect(page).to have_content('Food')
    end
  end
end
