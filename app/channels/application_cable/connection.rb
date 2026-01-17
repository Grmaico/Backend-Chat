module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      token = request.params[:token] || request.headers['Authorization']&.split(' ')&.last
      payload = JwtService.decode(token)
      self.current_user = User.find(payload['user_id']) if payload
    rescue
      reject_unauthorized_connection
    end
  end
end