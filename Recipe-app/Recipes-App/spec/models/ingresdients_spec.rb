require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let!(:recipe) { Recipe.create(name: 'Pizza') }
  let!(:food) { Food.create(name: 'Cheese', measurement_unit: 'oz', price: 2.99, quantity: 16, user_id: 1) }

  subject do
    described_class.new(
      recipe:,
      food:,
      quantity: 4.5
    )
  end

  it 'is not valid without a quantity' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a quantity less than or equal to 0' do
    subject.quantity = 0
    expect(subject).to_not be_valid
    subject.quantity = -1
    expect(subject).to_not be_valid
  end

  it 'is not valid with a quantity greater than 100' do
    subject.quantity = 101
    expect(subject).to_not be_valid
  end

  it 'is not valid without a recipe' do
    subject.recipe = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a food' do
    subject.food = nil
    expect(subject).to_not be_valid
  end
end
