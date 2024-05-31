class MessagesController < ApplicationController
  before_action :authenticate_user!, only: ['index']

  def index
    messages = Message.includes(:user).all

    render(json: messages, each_serializer: MessageSerializer, status: :ok)
    # render(json: messages, status: :ok)
  end
end
