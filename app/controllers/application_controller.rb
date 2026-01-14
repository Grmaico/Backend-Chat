class ApplicationController < ActionController::API
  before_action :authenticate_user

  def authenticate_user
    auth_header = request.headers['Authorization']
    token = auth_header&.split(' ')&.last

    if token
      begin
        decoded = JwtService.decode(token)
        @current_user = User.find(decoded[:user_id])
      rescue StandardError
        @current_user = nil
      end
    end

    render json: { error: 'Não autorizado' }, status: :unauthorized unless @current_user
  end
end