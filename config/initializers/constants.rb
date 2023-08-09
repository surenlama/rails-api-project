# password validation format
PASSWORD_CONTAINS_FORMAT = /\A
    (?=.*[A-Z]) # Must contain an uppercase character
    (?=.*[a-z]) # Must contain a lowercase character
    (?=.*\d) # Must contain a digit
    (\A[a-zA-Z0-9]+\z) # only english characters and numbers allowed
  /x
# email validation format
EMAIL_VALIDATION_FORMAT = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
# katakana validation format
KANA_VALIDATION_FORMAT = /\A[ァ-ヶー－ ]+\z/
GENDER_OPTIONS = %w(male female others)