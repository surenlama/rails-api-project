class ApplicationController < ActionController::API
    include UsersHelper
    include Response
    include Authentication
    include ErrorResponse
end
