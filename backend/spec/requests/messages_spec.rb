require 'rails_helper'

RSpec.describe('Messages', type: :request) do
  describe 'GET /messages' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:message) { FactoryBot.create(:message, user_id: user.id) }

    context 'login unauthorized' do
      it 'returns unauthorized status' do
        subject

        expect(response).to(have_http_status(:unauthorized))
      end
    end

    context 'login success' do
      before do
        tokens = sign_in(user)
        authenticated_headers(tokens)
      end

      it 'returns success status' do
        subject

        expect(response).to(have_http_status(:ok))
      end

      it 'returns messages data' do
        subject

        json = response.parsed_body.first

        expect(json['user_id']).to(eq(user.id))
        expect(json['name']).to(eq(user.name))
        expect(json['email']).to(eq(user.email))
        expect(json['content']).to(eq(message.content))
      end
    end
  end
end
