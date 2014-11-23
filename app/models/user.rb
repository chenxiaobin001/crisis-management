class User < ActiveRecord::Base
  
  self.primary_key = "pennkey"
  
  has_many :user_groups, class_name: "UserGroup", foreign_key: "pennkey"
  has_many :groups, :through => :user_groups

  attr_accessor :password
  validates :pennkey, presence:true, uniqueness:true, :on => :create
  validates :email, presence:true, uniqueness:true, :on => :create
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password

  before_save :encrypt_password

  def self.authenticate(pennkey, password)
    user = find_by_email(pennkey)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end




  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end



end

