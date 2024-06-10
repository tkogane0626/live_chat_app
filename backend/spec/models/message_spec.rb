require 'rails_helper'

RSpec.describe(Message, type: :model) do
  describe 'belongs_to' do
    context 'user' do
      it 'association' do
        association = described_class.reflect_on_association(:user)

        expect(association.macro).to(eq(:belongs_to))
      end
    end
  end

  describe 'has_many' do
    context 'likes' do
      it 'association' do
        association = described_class.reflect_on_association(:likes)

        expect(association.macro).to(eq(:has_many))
      end
    end
  end

  describe 'validates' do
    context 'content' do
      context 'presence' do
        let(:user) { FactoryBot.create(:user) }

        it 'valid' do
          message = described_class.new(content: 'content', user_id: user.id)

          expect(message).to(be_valid)
        end

        it 'invalid' do
          message = described_class.new(content: nil, user_id: user.id)

          expect(message).not_to(be_valid)
          expect(message.errors[:content]).to(include("can't be blank"))
        end
      end
    end
  end
end
