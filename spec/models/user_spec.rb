require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "will save successfully with all four fields set" do
      @user = User.new(name: "James", email: "hello@example.com", password: "123", password_confirmation: "123")
      @user.save
      expect(@user).to be_valid
    end

  end

end
