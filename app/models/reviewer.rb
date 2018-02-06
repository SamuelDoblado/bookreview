class Reviewer < ApplicationRecord
  has_secure_password
  has_many :books
  validates :name, :presence => true, :uniqueness => true
end
