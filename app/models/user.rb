class User < ActiveRecord::Base
  validates :username, 
    presence: true, 
    uniqueness: {case_sensitive: false}, 
    length: {mimimum:3, maximum: 25}

    VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email,
      format: {with: VALID_EMAIL_REGEX},
      presence: true, 
      uniqueness: {case_sensitive: false}, 
      length: {maximum: 105}
end