class Profile < ApplicationRecord
  has_many :sent_items, class_name: 'Item', inverse_of: 'sender', foreign_key: "sender_id"
  has_many :received_items, class_name: 'Item', inverse_of: 'recever', foreign_key: "receiver_id"
end
