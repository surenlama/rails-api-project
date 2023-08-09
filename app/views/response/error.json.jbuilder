json.result 'failure'
json.error do
  json.code @code
  json.url @url
  json.message @message
  json.message_body @message_body
  json.cause @cause
end