class Item < ApplicationRecord
  belongs_to :receiver, class_name: 'Profile', foreign_key: "receiver_id", optional: true
  belongs_to :sender, class_name: 'Profile', foreign_key: "sender_id", optional: true
end
