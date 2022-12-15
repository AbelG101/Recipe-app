require 'rails_helper'

RSpec.describe 'Public recipes', type: :feature do
  describe 'Public recipes page' do
    before :each do
      @user = User.create(name: 'John', email: 'user@example.com', password: 'password', confirmed_at: Time.now)
      @user.confirm
      @recipe1 = @user.recipes.create(name: 'pizza', preparation_time: '30mins', cooking_time: '90mins', description: 'the best pizza ever', public: true, user_id: @user)
      @recipe2 = @user.recipes.create(name: 'Lasagna', preparation_time: '40mins', cooking_time: '100mins', description: 'the best lasagna ever', public: false, user_id: @user)
      visit new_user_session_path
      within('body') do
        fill_in '@email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Login'
      sleep 3
      visit public_recipes_path
    end

    it 'renders page correctly' do
      expect(page).to have_http_status :ok
    end

    it "should display proper heading" do
      expect(page).to have_content ("Public Recipes")
    end

    it "should display proper title" do
      expect(page).to have_content ("pizza")
    end

    it "should display recipe description" do
      expect(page).to have_content ("the best pizza ever")
    end

    it "should not display non public recipes" do
      expect(page).to_not have_content ("lasagna")
    end
  end
end
