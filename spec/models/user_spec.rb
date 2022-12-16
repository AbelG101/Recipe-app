require 'rails_helper'

RSpec.describe User, type: :model do
  after(:each) do
    User.destroy_all
  end

  it 'should create a user' do
    @user = User.create(name: 'Kanye', email: 'kanye@yezee.fr', password: '123456789')
    expect(@user).to be_valid
  end
end
