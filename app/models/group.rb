class Group < ActiveRecord::Base

  has_many :user_groups, :dependent => :destroy
  has_many :users, through: :user_groups
  
  has_many :group_docs, :dependent => :destroy
  has_many :documents, through: :group_docs

  validates :group_name, uniqueness: true, presence:true
  
  
  def changeAccessibleDocs(doc_ids)
    
    GroupDoc.where(group_id:self.id).each do |gd|
      gd.destroy
    end
    
    doc_ids.each do |di|
      GroupDoc.create(group_id:self.id, document_id:di)
    end
    
  end
  
  def changeUsers(user_ids)
    
    UserGroup.where(group_id:self.id).each do |ug|
      ug.destroy
    end
    
    user_ids.each do |ui|
      UserGroup.create(group_id:self.id, user_id:ui)
    end
    
  end
  
  
  
  
  
end
