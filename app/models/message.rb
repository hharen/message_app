class Message < ApplicationRecord
  belongs_to :user
  belongs_to :message_group

  validates_presence_of :content
  after_create_commit -> { broadcast_append_to self.message_group }
end
