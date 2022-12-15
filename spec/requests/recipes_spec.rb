require 'rails_helper'

RSpec.describe '/recipes', type: :request do
  before :each do
    @user = User.create(name: 'John')
    @recipe = Recipe.create(name: 'pizza', preparation_time: '30mins', cooking_time: '90mins', description: 'the best', public: true, user_id: @user)
    @user.confirm
    sign_in @user
    get recipes_path
  end

  it "should show recipe name and description" do
    expect(response).to include('the best')
  end
  
end
