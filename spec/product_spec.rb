require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "will save successfully with all four fields set" do
      @category = Category.new
      @product = Product.new(name: "Kyra", price: 1000, quantity: 2, category: @category)
    end

    it "will fail when name is not present" do 
      @category = Category.new
      @product = Product.new(name: nil, price: 1000, quantity: 2, category: @category)
    end

    it "will fail when price is not present" do 
      @category = Category.new
      @product = Product.new(name: "Kyra", price: nil, quantity: 2, category: @category)
    end

    it "will fail when quantity is not present" do 
      @category = Category.new
      @product = Product.new(name: "Kyra", price: 1000, quantity: nil, category: @category)
    end

    it "will fail when category is not present" do 
      @category = Category.new
      @product = Product.new(name: , price: , quantity: , category: )
    end

  end


end