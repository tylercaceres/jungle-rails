require 'rails_helper'

describe Product do
  before(:each) do
    @category = Category.new
    @product = Product.new
  end
  
  describe 'Validations' do
    it 'returns true when name is not nil' do
      @product.name = 'name'
      @product.save
      expect(@product.errors[:name]).to be_empty
    end
    it 'returns false when name is nil' do
      @product.save
      expect(@product.errors[:name]).to_not be_empty
    end

    it 'returns true when price is not nil' do
      @product.price = 5
      @product.save
      expect(@product.errors[:price]).to be_empty
    end
    it 'returns false when price is nil' do
      @product.save
      expect(@product.errors[:price]).to_not be_empty
    end

    it 'returns true when quantity is not nil' do
      @product.quantity = 'quantity'
      @product.save
      expect(@product.errors[:quantity]).to be_empty
    end
    it 'returns false when quantity is nil' do
      @product.save
      expect(@product.errors[:quantity]).to_not be_empty
    end

    it 'returns true when category is not nil' do
      @product.category = @category
      @product.save
      expect(@product.errors[:category]).to be_empty
    end
    it 'returns false when category is nil' do
      @product.save
      expect(@product.errors[:category]).to_not be_empty
    end

  end

end
