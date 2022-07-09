class OmniAuthTest
  def valid_google_login
    #if Rails.env.test?
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(Faker::Omniauth.google)
    #end
  end
end


#OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
#  :provider => 'google',
#  :uid => '1337',
#  :info => {
#      'name' => 'JonnieHallman',
#      'email' => 'jon@test.com'
#      }
#  :credentials => {
#    'token' => 'mock_token',
#    'secret' => 'mock_secret'
#  }
#})