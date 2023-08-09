json.result 'success'
json.updated true
json.data do
  json.partial! 'users/user', user: @user
end
