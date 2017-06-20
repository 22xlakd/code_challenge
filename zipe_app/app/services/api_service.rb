require 'rest-client'

class ApiService
  def initialize
    @app_key ||= Rails.configuration.zipe_app_key
  end
end
