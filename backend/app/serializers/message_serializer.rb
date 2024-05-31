class MessageSerializer < ActiveModel::Serializer
  attributes(:id, :user_id, :name, :content, :email, :created_at)

  def user_id
    object.user.id
  end

  def name
    object.user.name
  end

  def email
    object.user.email
  end
end
