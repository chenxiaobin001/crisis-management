class Document < ActiveRecord::Base
  
  has_many :group_docs, :dependent => :destroy
  has_many :groups, through: :group_docs
  
  validate :document_name, presence: true, uniqueness: true
  validate :url, presence: true
  

  def users
    result_users = []
    self.groups.each do |g|
      g.users.each do |u|
        result_users << u
      end
    end
    return result_users.to_s
    
  end

end
