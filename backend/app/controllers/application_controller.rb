class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  def index
    Rails.logger.debug('Hello World!')
  end
end
