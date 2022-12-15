require 'rails_helper'

RSpec.describe 'foods', type: :feature do
  describe 'Tesing the creation of food' do
    before :each do
      @user1 = User.create(name: 'Betse', email: 'user@example.com', password: 'password', confirmed_at: Time.now)
      @recipe1 = Recipe.create(name: 'Cooking', preparation_time: '20', cooking_time: '20', description: 'good food', public: true, user_id: @user1)
      @food1 = Food.create(name: 'Potato', measurement_unit: 'kg', quantity: 4, price: 2, user_id: @user1)
      @recipe_food1 = RecipeFood.create(quantity: 1, food_id: @food1, recipe_id: @recipe1)

      visit new_user_session_path
      within('body') do
        fill_in '@email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Login'
      sleep 3
      visit recipes_path
      # click_link 'Recipes'
      # page.find_link('Show this recipe').click
      # click_button 'Generate Shopping List'
      puts "afsfdasdfsadf"
      puts page.body
    end

    it 'shows recipe food list for a single recipe' do
      expect(page).to have_content('Cooking')
    end

  end
end