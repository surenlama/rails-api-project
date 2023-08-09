class AuthLoginForm
    include ActiveModel::Model
  
    attr_accessor :email,
                  :password
  
    validates :email, presence: true
    validates :password, presence: true
  
    def initialize(params = {})
      @email = params[:email]
      @password = params[:password]
    end
  end