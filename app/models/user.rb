class User < ActiveRecord::Base

  has_many :user_groups, :dependent => :destroy
  has_many :groups, :through => :user_groups

  attr_accessor :password
  validates :pennkey, presence:true, uniqueness:true, :on => :create
  validates :email, presence:true, uniqueness:true, :on => :create
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  
  validates_inclusion_of :privilege, :in => [0,1,2,3]
  validates_inclusion_of :school, :in => [nil, 'seas', 'medical', 'law', 'wharton', 'art']
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

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
  
  def after_initialize
    group = Group.where(group_name: "default#{self.pennkey}")
    unless group
      group = Group.create(group_name: "default#{self.pennkey}")
    end
    
    UserGroup.create(group_id: group.id, user_id:self.id)
   
  end
  
  def addAccessibleDocs(doc_ids)
    group = Group.find_by(group_name:"default#{self.pennkey}")
    doc_ids.each do |di|
      GroupDoc.create(group_id:group.id, document_id:di)
    end
  end
  
  def deleteAccessibleDocs(doc_ids)
    group = Group.find_by(group_name:"default#{self.pennkey}")
    doc_ids.each do |di|
      gd = GroupDoc.find_by(group_id:group_id, document_id:di)
      gd.destroy  
    end
  end
  
  def defaultGroup
    Group.find_by(group_name: "default#{self.pennkey}")
  end

  def documents
     result_documents = []
     self.groups.each do |g|
       g.documents.each do |d|
         result_documents << d
       end
     end
     return result_documents.to_set
  end
  
end

