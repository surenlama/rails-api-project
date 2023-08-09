json.result 'success'
json.created true
json.data do
  json.partial! 'contacts/contact', contact: @contact
end