class Group < ActiveRecord::Base
  
  has_many :user_groups
  has_many :users, through: :user_groups
  
  has_many :group_docs
  has_many :documents, through: :group_docs
  
  validates :group_name, uniqueness: true, presence:true
  
end
