require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "Creates a new product" do
        @category = Category.new
        @product = Product.new(name: "Moriarty", price: 10, quantity: 10, category: @category)
        expect(@product).to be_valid
    end

    it "Not valid without a name" do
      @category = Category.new
      @product = Product.new(name: nil, price: 10, quantity: 10, category: @category)
      expect(@product).to be_invalid
    end

    it "Not valid without a price" do
      @category = Category.new
      @product = Product.new(name: "Moriarty", price: nil, quantity: 10, category: @category)
      expect(@product).to be_invalid
    end

    it "Not valid without a quantity" do
      @category = Category.new
      @product = Product.new(name: "Moriarty", price: 10, quantity: nil, category: @category)
      expect(@product).to be_invalid
    end

    it "Not valid without a category" do
      @category = Category.new
      @product = Product.new(name: "Moriarty", price: 10, quantity: 10, category: nil)
      expect(@product).to be_invalid
    end

  end
end