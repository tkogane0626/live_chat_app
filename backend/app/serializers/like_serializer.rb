class LikeSerializer < ActiveModel::Serializer
  attributes(:id, :email, :message)

  def email
    instance_options[:current_user][:email]
  end

  def message
    instance_options[:message]
  end
end
