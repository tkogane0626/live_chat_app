class LikesController < ApplicationController
  before_action :authenticate_user!, only: %w[create destroy]

  SAVE_SUCCESS_MESSAGE = '保存に成功しました'.freeze
  SAVE_FAILED_MESSAGE = '保存に失敗しました'.freeze
  DESTROY_SUCCESS_MESSAGE = '削除に成功しました'.freeze
  DESTROY_FAILED_MESSAGE = '削除に失敗しました'.freeze

  def create
    like = Like.new(message_id: params[:id], user_id: current_user.id)
    like.save!

    render(json: like, serializer: LikeSerializer, current_user:, message: SAVE_SUCCESS_MESSAGE, status: :ok)
  rescue StandardError => e
    render(json: { message: SAVE_FAILED_MESSAGE, errors: e }, status: :not_found)
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy!

    render(json: like, serializer: LikeSerializer, current_user:, message: DESTROY_SUCCESS_MESSAGE, status: :ok)
  rescue StandardError => e
    render(json: { message: DESTROY_FAILED_MESSAGE, errors: e }, status: :not_found)
  end
end
