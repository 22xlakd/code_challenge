require 'rest-client'

class ApiService
  def initialize
    @app_key ||= Rails.configuration.zype_app_key
    @client_id ||= Rails.configuration.zype_client_id
    @client_secret ||= Rails.configuration.zype_client_secret
  end
end
