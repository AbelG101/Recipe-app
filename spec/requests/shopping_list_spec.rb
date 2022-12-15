require 'rails_helper'

RSpec.describe 'foods', type: :feature do
  describe 'Tesing the creation of food' do
    before :each do
      @user1 = User.create(name: 'Betse', email: 'user@example.com', password: 'password', confirmed_at: Time.now)
      @recipe1 = Recipe.create(name: 'Cooking', preparation_time: '20', cooking_time: '20', description: 'good food', public: true, user_id: @user1.id)
      @food1 = Food.create(name: 'Potato', measurement_unit: 'kg', quantity: 4, price: 2, user_id: @user1.id)
      @recipe_food1 = RecipeFood.create(quantity: 4, food_id: @food1.id, recipe_id: @recipe1.id)

      visit new_user_session_path
      within('body') do
        fill_in '@email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Login'

      visit recipes_path
      page.find_link('Show this recipe').click
      page.find_link('Generate shoping list').click
    end

    it 'Total value of food calculated' do
      expect(page).to have_content('$8.0')
    end

    it 'Total value of food needed text exists' do
      expect(page).to have_content('Total value of food needed')
    end

    it 'Amount of food text exists' do
      expect(page).to have_content('Amount of food')
    end

    it 'Total number of foods on shoping list' do
      expect(page).to have_content('1')
    end

    it 'Unit price of the food' do
      expect(page).to have_content('$2.0')
    end

    it 'Total quantity of the given food' do
      expect(page).to have_content('4kg')
    end

  end
end