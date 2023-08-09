json.result 'success'
json.created true
json.data do
  json.partial! 'users/user', user: @user
end