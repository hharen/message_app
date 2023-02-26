class MessageGroup < ApplicationRecord
  has_many :messages

  validates_uniqueness_of :name
  after_create_commit -> { broadcast_prepend_to "message_groups", partial: "message_groups/message_group", locals: { quote: self }, target: "message_groups" }
end
