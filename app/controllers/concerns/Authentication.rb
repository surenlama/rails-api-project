module Authentication
    extend ActiveSupport::Concern
  
    def authenticate_user
      return error_unauthorized if request.headers['token'].nil?
  
      user = User.where(token: request.headers['token']).first
      return error_unauthorized if user.nil?
  
      @current_user = user
    end
end