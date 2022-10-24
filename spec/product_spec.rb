require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    # each example will needs its own @category created and then @product initialized with that category
    it "will save successfully with all four fields set" do
      @category = Category.new
      # initial example that ensures that a product with all four fields set will indeed save successfully
      @product = Product.new(name: "Kyra", price: 1000, quantity: 2, category: @category)
      # save successfully
      @product.save
      # Test that the expect error is found within the .errors.full_messages array
      expect(@product).to be_valid
    end

    it "will fail when name is not present" do 
      @category = Category.new
      # Set all fields to a value but the validation field being tested to nil
      @product = Product.new(price: 1000, quantity: 2, category: @category)
      @product.save
      puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "will fail when price is not present" do 
      @category = Category.new
      @product = Product.new(name: "Kyra", quantity: 2, category: @category)
      @product.save
      puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Price cents is not a number","Price can't be blank", "Price is not a number")
    end

    it "will fail when quantity is not present" do 
      @category = Category.new
      @product = Product.new(name: "Kyra", price: 1000, category: @category)
      @product.save
      puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "will fail when category is not present" do 
      @category = Category.new
      @product = Product.new(name: "Kyra", price: 1000, quantity: 2)
      @product.save
      puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Category must exist", "Category can't be blank")
    end

  end

end