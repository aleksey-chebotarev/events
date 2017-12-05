class Subscribe < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: true,
            format: { with: VALID_EMAIL_REGEX, message: 'email is invalid' }
end
