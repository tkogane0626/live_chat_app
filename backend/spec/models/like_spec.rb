require 'rails_helper'

RSpec.describe(Like, type: :model) do
  describe 'belongs_to' do
    context 'user' do
      it 'association' do
        association = described_class.reflect_on_association(:user)

        expect(association.macro).to(eq(:belongs_to))
      end
    end

    context 'message' do
      it 'association' do
        association = described_class.reflect_on_association(:message)

        expect(association.macro).to(eq(:belongs_to))
      end
    end
  end
end
