class UserService < ApiService
  def authenticate(username=nil, password=nil)
    raise ArgumentError.new("Username and Password can't be nil") if username.nil? || password.nil?

    begin
      response = RestClient.post('https://login.zype.com/oauth/token/',{client_id: @client_id, client_secret: @client_secret, username: username, password: password, grant_type: 'password'})
    rescue RestClient::Unauthorized
      return {:error => 'Unauthorized', :error_message => 'Username or password invalid'}
    end

    case response.code
    when 200
      user_data = JSON.parse(response.body, :symbolize_names => true)
    when 404
      return {:error => 'NotFound', :error_message => 'Source not found'}
    else
      return {:error => 'NotFound', :error_message => 'Source not found'}
    end

    user_data
  end
end
