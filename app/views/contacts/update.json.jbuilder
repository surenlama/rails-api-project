json.result 'success'
json.updated true
json.data do
  json.partial! 'contacts/contact', contact: @contact
end