require 'rails_helper'

RSpec.describe 'foods', type: :feature do
  describe 'Tesing the creation of food' do
    before :each do
      @user1 = User.create(name: 'Betse', email: 'user@example.com', password: 'password', confirmed_at: Time.now)
      @recipe = @user1.recipes.create(name: 'pizza', preparation_time: '30mins', cooking_time: '90mins', description: 'the best pizza ever', public: true, user_id: @user)
      @food1 = @user1.foods.create(name: 'Potato', measurement_unit: 'kg', quantity: 4, price: 2, user_id: @user1)
      visit new_user_session_path
      within('body') do
        fill_in '@email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Login'
      sleep 3
      visit new_recipe_recipe_food_path(@recipe)
    end

    it 'renders page correctly' do
      expect(page).to have_http_status :ok
    end

    it 'should show proper title' do
      expect(page).to have_content('Add ingredient for food')
    end

    it 'shows food proper quantity title' do
      expect(page).to have_content('Quantity')
    end

    it 'shows added food in the dropdown' do
      expect(page).to have_content('Potato')
    end

    it 'shows add ingredient button' do
      expect(page).to have_content('Add ingredient')
    end
  end
end