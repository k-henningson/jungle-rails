require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "will save successfully with all four fields set" do
      @user = User.new(name: "James", email: "hello@example.com", password: "123", password_confirmation: "123")
      @user.save
      expect(@user).to be_valid
    end

    it "will fail when name is not present" do 
      @user = User.new(email: "hello@example.com", password: "123", password_confirmation: "123")
      @user.save
      puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end


    it "will fail when email is not present" do 
      @user = User.new(name: "James", password: "123", password_confirmation: "123")
      @user.save
      puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "will fail when password is not present" do 
      @user = User.new(name: "James", email: "hello@example.com", password_confirmation: "123")
      @user.save
      puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end


    it "will fail when password confirmation is not present" do 
      @user = User.new(name: "James", email: "hello@example.com", password: "123")
      @user.save
      puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

  end

end
