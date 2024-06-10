require 'rails_helper'

RSpec.describe('Likes', type: :request) do
  describe 'POST /messages/:id/likes' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:message) { FactoryBot.create(:message, user_id: user.id) }

    context 'login unauthorized' do
      let(:id) { message.id }

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

      context 'like success' do
        let(:id) { message.id }

        it 'returns success status' do
          subject

          expect(response).to(have_http_status(:ok))
        end

        it 'returns success data' do
          subject

          json = response.parsed_body

          expect(json['email']).to(eq(user.email))
          expect(json['message']).to(eq(LikesController::SAVE_SUCCESS_MESSAGE))
        end
      end

      context 'like failed' do
        let(:id) { message.id + 1 }

        it 'returns not_found status' do
          subject

          expect(response).to(have_http_status(:not_found))
        end

        it 'return error message' do
          subject

          json = response.parsed_body

          expect(json['message']).to(eq(LikesController::SAVE_FAILED_MESSAGE))
          expect(json['errors']).to(include('Validation failed'))
        end
      end
    end
  end

  describe 'DELETE /likes/:id' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:message) { FactoryBot.create(:message, user_id: user.id) }
    let!(:like) { FactoryBot.create(:like, user_id: user.id, message_id: message.id) }

    context 'login unauthorized' do
      let(:id) { like.id }

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

      context 'delete like success' do
        let(:id) { like.id }

        it 'returns success status' do
          subject

          expect(response).to(have_http_status(:ok))
        end

        it 'returns success data' do
          subject

          json = response.parsed_body

          expect(json['email']).to(eq(user.email))
          expect(json['message']).to(eq(LikesController::DESTROY_SUCCESS_MESSAGE))
        end
      end

      context 'delete like failed' do
        let(:dummy_id) { like.id + 1 }
        let(:id) { dummy_id }

        it 'returns not_found status' do
          subject

          expect(response).to(have_http_status(:not_found))
        end

        it 'returns error message' do
          subject

          json = response.parsed_body

          expect(json['message']).to(eq(LikesController::DESTROY_FAILED_MESSAGE))
          expect(json['errors']).to(include("Couldn't find Like with 'id'=#{dummy_id}"))
        end
      end
    end
  end
end
