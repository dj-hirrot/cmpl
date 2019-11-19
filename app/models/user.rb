class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable

  validates :name, presence: true, length: { minimum: 5, maximum: 20 } format: { /\A[a-zA-Z0-9]+\z/ }
  validates :password, length: { minimum: 10 }

  include DeviseTokenAuth::Concerns::User
end
