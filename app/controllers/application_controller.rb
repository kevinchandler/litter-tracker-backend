class ApplicationController < ActionController::API
  before_action :authenticate!

  def authenticate!
    unless params[:api_key] && params[:api_key] == ENV['API_KEY']
      render :forbidden, json: {}
    end
  end
end
