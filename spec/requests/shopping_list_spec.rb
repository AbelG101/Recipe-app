require 'rails_helper'

RSpec.describe 'foods', type: :feature do
  describe 'Tesing the creation of food' do
    before :each do
      @user1 = User.create(name: 'Betse', email: 'user@example.com', password: 'password', confirmed_at: Time.now)
      @recipe1 = @user1.recipes.create(name: 'Cooking', preparation_time: '20', cooking_time: '20',
                                       description: 'good food', public: true, user_id: @user1)
      @food1 = @user1.foods.create(name: 'Potato', measurement_unit: 'kg', quantity: 4, price: 2, user_id: @user1)

      visit new_user_session_path
      within('body') do
        fill_in '@email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Login'
      sleep 3
      visit recipe_path(@recipe1)
      click_link('Generate shoping list')
    end

    it 'renders page correctly' do
      expect(page).to have_http_status :ok
    end

    it 'shows proper title' do
      expect(page).to have_content('Shopping List')
    end

    it 'shows proper subtitle' do
      expect(page).to have_content('Total value of food needed: ')
    end

    it 'shows proper subtitle' do
      expect(page).to have_content('Amount of food: ')
    end

    it 'shows recipe food list for a single recipe' do
      expect(page).to have_content('Food')
      expect(page).to have_content('Quantity')
      expect(page).to have_content('Unit')
      expect(page).to have_content('Price')
      expect(page).to have_content('Value')
    end
  end
end
