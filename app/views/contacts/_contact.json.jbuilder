json.extract! contact, :id, :first_name, :last_name, :email
json.status contact.status if contact.respond_to?(:status)
