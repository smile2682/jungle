require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    it 'should pass if all four fields are set' do
      @category = Category.new(name:'computer related')
      @product = Product.new(name:'auto-clicked mouse',price:34.99,quantity:100, category:@category )
      expect(@product).to be_valid
    end
    
    it 'should not pass if the name field is nil' do
      @category = Category.new(name:'computer related')
      @product = Product.new(name:nil,price:34.99,quantity:100, category:@category )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to be_present
      # puts 'ERROR MESSAGE', @product.errors.full_messages
    end

    it 'should not pass if the name field is nil' do
      @category = Category.new(name:'computer related')
      @product = Product.new(name:'auto-clicked mouse',price:nil,quantity:100, category:@category )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to be_present
      # puts 'ERROR MESSAGE', @product.errors.full_messages
    end

    it 'should not pass if the price field is nil' do
      @category = Category.new(name:'computer related')
      @product = Product.new(name:'auto-clicked mouse',price:34.99,quantity:nil, category:@category )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to be_present
      # puts 'ERROR MESSAGE', @product.errors.full_messages
    end

    it 'should not pass if the quantity field is nil' do
      @category = Category.new(name:'computer related')
      @product = Product.new(name:'auto-clicked mouse',price:34.99,quantity:nil, category:@category )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to be_present
      # puts 'ERROR MESSAGE', @product.errors.full_messages
    end
  end




end
