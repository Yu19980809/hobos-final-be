class Api::V1::BaseController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :verify_request

  # find the secret
  HMAC_SECRET = Rails.application.credentials.dig(:jwt, :hmac_secret)

  # When token is expired, JWT::ExpiredSignature error will be raised
  rescue_from JWT::ExpiredSignature, with: :render_unauthorize

  private

  def verify_request
    token = fetch_jwt_token

    if token.present?
      data = jwt_decode(token)
      user_id = data[:user_id]
      @current_user = User.find(user_id) # set current user by user_id in JWT payload
    else
      render json: { error: 'Missing JWT token.' }, status: 401
    end
  end

  # decode JWT, then turn payload into a hash
  def jwt_decode(token)
    decoded_info = JWT.decode(token, HMAC_SECRET, { algorithm: 'HS256' })[0] # extract the payload
    HashWithIndifferentAccess.new decoded_info
  end

  # retrieve token from headers
  def fetch_jwt_token
    request.headers['Authorization']
  end

  def render_unauthorized
    render json: { error: 'token expired' }, status: 401
  end
end
