module RequestSpecHelper
  def valid_headers
    {
      'Authorization' => JsonWebToken.encode(user_id: user.id),
      'Content-Type' => 'application/json'
    }
  end
end
