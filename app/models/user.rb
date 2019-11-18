class User < ApplicationRecord
  # :confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  validates :password, length: { minimum: 10 }
end
