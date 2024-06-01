class MessageSerializer < ActiveModel::Serializer
  attributes(:id, :user_id, :name, :content, :email, :created_at, :likes)

  def user_id
    object.user.id
  end

  def name
    object.user.name
  end

  def email
    object.user.email
  end

  def likes
    object.likes.map { |like| { id: like.id, email: like.user.email } }
  end
end
