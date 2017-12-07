class User < ApplicationRecord
  rolify

  devise :database_authenticatable, :rememberable,
         :trackable, :validatable
end
