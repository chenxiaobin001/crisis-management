class UserGroupValidator < ActiveModel::Validator
  def validate(record)
    if User.where("user_id = '#{record.user_id}'").size == 0
      record.errors[:base] << "No such a record."
    end
    if Group.where("id = '#{record.group_id}'").size == 0
      record.errors[:base] << "No such a record."
    end
  end
end


class UserGroup < ActiveRecord::Base
  
  belongs_to :user, :foreign_key=> :user_id
  belongs_to :group, :foreign_key=> :group_id
  self.primary_keys = :user_id, :group_id
  validates :group_id, uniqueness: { scope: :user_id}, presence:true
  validates :user_id, uniqueness: { scope: :group_id}, presence:true
  
  validates_with UserGroupValidator
  
end

