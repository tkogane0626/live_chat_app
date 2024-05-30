class ApplicationController < ActionController::API
  def index
    Rails.logger.debug('Hello World!')
  end
end
