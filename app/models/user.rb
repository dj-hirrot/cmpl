class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable

  validates :username, presence: true, length: { minimum: 5, maximum: 15 }, uniqueness: { case_sensitive: true }, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :email,    uniqueness: { case_sensitive: true }
  validates :password, length: { minimum: 10 }
end
