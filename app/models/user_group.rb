class UserGroupValidator < ActiveModel::Validator
  def validate(record)
    if User.where("pennkey = '#{record.pennkey}'").size == 0
      record.errors[:base] << "No such a record."
    end
    if Group.where("id = '#{record.group_id}'").size == 0
      record.errors[:base] << "No such a record."
    end
  end
end


class UserGroup < ActiveRecord::Base
  
  belongs_to :user, class_name: "User", foreign_key: "pennkey"
  belongs_to :group
  
  validates :group_id, uniqueness: { scope: :pennkey}, presence:true
  validates :pennkey, uniqueness: { scope: :group_id}, presence:true
  
  validates_with UserGroupValidator
  
end

