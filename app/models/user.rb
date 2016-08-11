class User < ActiveRecord::Base
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
end
