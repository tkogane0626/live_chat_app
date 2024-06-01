class MessagesController < ApplicationController
  before_action :authenticate_user!, only: ['index']

  def index
    messages = Message.includes(:user, likes: :user).all

    render(json: messages, each_serializer: MessageSerializer, status: :ok)
  end
end
