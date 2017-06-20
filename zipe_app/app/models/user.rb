class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_secure_password

  def self.get_api_user(username=nil, password=nil)
    hs_data = UserService.new().authenticate(username, password)

    if hs_data.key?(:access_token)
      c_user = User.find_or_create_by(username: username)
      c_user.password = password
      c_user.access_token = hs_data[:access_token]
      c_user.save
    else
      return nil
    end

    c_user
  end
end
