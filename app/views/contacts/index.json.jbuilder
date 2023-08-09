# frozen_string_literal: true

json.result 'success'
json.metadata do
  # json.page @pagy.page

end
json.data do
  json.array! @contacts.each do |contact|
    json.id contact.id
    json.first_name contact.first_name
    json.last_name contact.last_name
    json.email contact.email
    json.image contact.image
  end
end