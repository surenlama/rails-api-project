# frozen_string_literal: true

json.result 'success'
json.metadata do
  # json.page @pagy.page
  # json.per_page @pagy.items
  # json.page_count @pagy.pages
  # json.total_count @pagy.count
end
json.data do
  json.array! @users.each do |user|
    json.partial! 'users/user', user: user
  end
end












