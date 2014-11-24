class User < ActiveRecord::Base
  
  has_many :user_groups, :dependent => :destroy
  has_many :groups, :through => :user_groups

  attr_accessor :password
  validates :pennkey, presence:true, uniqueness:true, :on => :create
  validates :email, presence:true, uniqueness:true, :on => :create
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password

  before_save :encrypt_password

  def self.authenticate(pennkey, password="")
    user = find_by_pennkey(pennkey)
    if user && BCrypt::Password.new(user.password_hash) == password
      user
    else
      nil
    end
  end


  def encrypt_password
    self.password_hash = BCrypt::Password.create(password) if password.present?
  end



end

