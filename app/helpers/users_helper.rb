module UsersHelper
  def format_name(user)
    if user.gender == 1
      "Mr. #{user.first_name} #{user.last_name}"
    elsif user.gender == 0
      "Ms. #{user.first_name} #{user.last_name}"
    else
      "#{user.first_name} #{user.last_name}"
    end
  end

  def format_height(user)
    if user.height.present?
      "#{user.height} cm"
    else
      nil
    end
  end

  def format_weight(user)
    if user.weight.present?
      "#{user.weight} kg"
    else
      nil
    end
  end

  def format_gender(user)
    if user.gender.present?
      GENDER_OPTIONS[user.gender]
    else
      nil
    end
  end
end
