class User < ApplicationRecord
  validates :email, uniqueness: { case_sensitive: false }
  def set_age(dob)
    now = Time.now.utc.to_date
    self.age = now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end