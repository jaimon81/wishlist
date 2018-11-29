class User < ApplicationRecord

  PASSWORD_FORMAT = /\A
   (?=.*[a-z])        # Must contain a lower case character
   (?=.*[A-Z])        # Must contain an upper case character
 /x

  validates :user_name, :uniqueness => {:message => "already exists."}
  validates :password, length: { minimum: 8}#,format: { with: PASSWORD_FORMAT }
  validates :email, :presence => {:message => "Email address can't be left balnk."},
                  :length => {:minimum => 3, :maximum => 254, :message => "Email length is too short (minimum is 5 characters)."},
                  :uniqueness => {:message => "already exists"}


  validates :password,confirmation: true
  has_many :wishes
  has_attached_file :prof_pic
  validates_attachment :prof_pic, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  def encryptPass(pass)
    self.password = Digest::SHA256.hexdigest(pass);
  end

  def encryptPassonfirm(pass)
    self.password_confirmation = Digest::SHA256.hexdigest(pass);
  end

  def self.authenticate(username, password)
    user = User.where(['user_name = ?' , username]).first
    if user.blank?
      user = nil
    end

    if user.blank? || Digest::SHA256.hexdigest(password) != user.password
      user = nil
    end

    return user
  end





  # PASSWORD_FORMAT = /\A
  #  (?=.{8,})          # Must contain 8 or more characters
  #  (?=.*\d)           # Must contain a digit
  #  (?=.*[a-z])        # Must contain a lower case character
  #  (?=.*[A-Z])        # Must contain an upper case character
  #  (?=.*[[:^alnum:]]) # Must contain a symbol
  # /x


end
