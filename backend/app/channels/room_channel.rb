class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from('room_channel')
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    user = User.find_by(email: data['email'])
    data_message = data['message']

    if data_message.present?
      begin
        message = Message.create!(content: data_message, user_id: user.id)
      rescue StandardError => e
        Rails.logger.error(e)
      end
    end

    ActionCable.server.broadcast(
      'room_channel',
      {
        message: data_message,
        name: user.name,
        created_at: message&.created_at
      }
    )
  end
end
