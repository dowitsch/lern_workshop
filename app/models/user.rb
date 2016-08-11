class User < ActiveRecord::Base
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy


  def self.authenticate(vorname="", login_password="")
    user = User.find_by(vorname: vorname)
    if user && user.match_password(login_password, user)
      return user
    else
      return false
    end
  end

  def match_password(login_password="", user)
    user.passwort == Digest::SHA1.hexdigest(login_password)
  end





end
