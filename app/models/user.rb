class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable, authentication_keys: [:username, :email]

  validates :username, presence: true,
                       uniqueness: { case_sensitive: true },
                       length: { minimum: 5, maximum: 20 },
                       format: { with: /\A[a-zA-Z0-9]+\z/ }

  include DeviseTokenAuth::Concerns::User
end
