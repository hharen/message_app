class User < ApplicationRecord
  has_many :messages

  validates_uniqueness_of :username
  after_create_commit -> { broadcast_prepend_to "users", partial: "users/user", locals: { quote: self }, target: "users" }
end
