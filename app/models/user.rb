class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable, authentication_keys: [:name, :email]

  validates :name, presence: true,
                   uniqueness: { case_sensitive: true },
                   length: { minimum: 5, maximum: 20 },
                   format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :password, length: { minimum: 10 }

  include DeviseTokenAuth::Concerns::User
end
