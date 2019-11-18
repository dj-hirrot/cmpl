class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable

  validates :password, length: { minimum: 10 }

  include DeviseTokenAuth::Concerns::User
end
