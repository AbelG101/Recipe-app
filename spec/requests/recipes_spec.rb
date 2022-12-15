require 'rails_helper'

RSpec.describe 'recipes', type: :feature do
  before :each do
    @user = User.create(name: 'John', email: 'user@example.com', password: 'password', confirmed_at: Time.now)
    @user.confirm
    recipe = @user.recipes.create(name: 'pizza', preparation_time: '30mins', cooking_time: '90mins',
                                  description: 'the best pizza ever', public: true, user_id: @user)
    visit new_user_session_path
    within('body') do
      fill_in '@email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Login'
    sleep 3
    visit recipe_path(recipe)
  end

  it 'renders page correctly' do
    expect(page).to have_http_status :ok
  end

  it 'should show recipe name' do
    expect(page).to have_content('pizza')
  end

  it 'should show recipe description' do
    expect(page).to have_content('the best pizza ever')
  end

  it 'should show recipe cooking time' do
    expect(page).to have_content('90mins')
  end

  it 'should show recipe preparation time' do
    expect(page).to have_content('30mins')
  end

  it 'should show generate shopping list button' do
    expect(page).to have_content('Generate shoping list')
  end

  it 'should show generate add ingredient button' do
    expect(page).to have_content('Add ingredient')
  end
end
