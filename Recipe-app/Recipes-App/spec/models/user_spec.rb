# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(
      name: 'John Doe',
      email: 'johndoe@example.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with a name longer than 50 characters' do
      subject.name = 'a' * 51
      expect(subject).to_not be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with an email longer than 255 characters' do
      subject.email = "#{'a' * 244}@example.com"
      expect(subject).to_not be_valid
    end

    it 'is not valid with a duplicate email' do
      duplicate_user = subject.dup
      subject.save
      expect(duplicate_user).to_not be_valid
    end
  end
end
