# frozen_string_literal: true

json.result 'success'
json.data do
  json.partial! 'users/user', user: @user
end