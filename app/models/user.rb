class User < ActiveRecord::Base
  
  attr_accessor :password 
  before_save :encrypt_password
  attr_accessible :pennkey, :password, :password_confirmation, :level
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :pennkey
  validates_uniqueness_of :pennkey
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  def self.authenticate(pennkey, password)
    user = find_by_pennkey(pennkey)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def self.delete(pennkey)
    user = User.where(pennkey: pennkey).first
    user.destroy
  end

end
