class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from('room_channel')
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive
    user = User.find_by(email: data['email'])

    return unless (message = Message.create!(content: data['message'], user_id: user.id))

    ApplicationCable.server.broadcast('room_channel', { message: data['message'], name: user.name, created_at: message.created_at })
  end
end