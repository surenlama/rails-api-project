# frozen_string_literal: true
json.id user.id
json.full_name format_name(user)
json.first_name_kana user.first_name_kana
json.last_name_kana user.last_name_kana
json.age user.age
json.gender format_gender(user)
json.email user.email
# json.phone_number user.phone_number
json.birth_date user.birth_date
json.height format_height(user)
json.weight format_weight(user)