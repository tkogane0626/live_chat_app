require 'rails_helper'

RSpec.describe(User, type: :model) do
  describe 'has_many' do
    context 'messages' do
      it 'association' do
        association = described_class.reflect_on_association(:messages)

        expect(association.macro).to(eq(:has_many))
      end
    end

    context 'likes' do
      it 'association' do
        association = described_class.reflect_on_association(:likes)

        expect(association.macro).to(eq(:has_many))
      end
    end
  end

  describe 'validates' do
    context 'name' do
      context 'presence' do
        it 'valid' do
          user = described_class.new(
            name: 'name',
            email: 'foobar@example.com',
            password: 'foobar',
            password_confirmation: 'foobar'
          )

          expect(user).to(be_valid)
        end

        it 'invalid' do
          user = described_class.new(
            name: nil,
            email: 'foobar@example.com',
            password: 'foobar',
            password_confirmation: 'foobar'
          )

          expect(user).not_to(be_valid)
          expect(user.errors[:name]).to(include("can't be blank"))
        end
      end

      context 'length' do
        it 'valid' do
          user = described_class.new(
            name: 'a' * 30,
            email: 'foobar@example.com',
            password: 'foobar',
            password_confirmation: 'foobar'
          )

          expect(user).to(be_valid)
        end

        it 'invalid' do
          user = described_class.new(
            name: 'a' * 31,
            email: 'foobar@example.com',
            password: 'foobar',
            password_confirmation: 'foobar'
          )

          expect(user).not_to(be_valid)
          expect(user.errors[:name]).to(include('is too long (maximum is 30 characters)'))
        end
      end
    end
  end
end
