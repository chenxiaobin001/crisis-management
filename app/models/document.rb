class Document < ActiveRecord::Base
  
  has_many :group_docs, :dependent => :destroy
  has_many :groups, through: :group_docs
  
  validate :document_name, presence: true, uniqueness: true
  validate :url, presence: true
  
end
