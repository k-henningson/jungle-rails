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


    it "will fail when password and password confirmation do not match" do 
      @user = User.new(name: "James", email: "hello@example.com", password: "123", password_confirmation: "456")
      @user.save
      puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "will fail when email is not unique" do 
      @user1 = User.new(name: "James", email: "hello@example.com", password: "123", password_confirmation: "123")
      @user1.save
      @user2 = User.new(name: "James", email: "hello@example.com", password: "123", password_confirmation: "123")
      @user2.save
      puts @user2.errors.full_messages
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it "will fail when password is not at least 2 characters" do 
      @user = User.new(name: "James", email: "hello@example.com", password: "1", password_confirmation: "1")
      @user.save
      puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 2 characters)")
    end

  end

    describe '.authenticate_with_credentials' do
      # examples for this class method here
      it "will verify user created is same as user logging in" do
        @user = User.create(name: "Kyra", email: "test@test.com", password: "testpassword", password_confirmation: "testpassword")
        @user = User.authenticate_with_credentials("test@test.com", "testpassword")
        expect(@user).to be_truthy
      end
    end

end
