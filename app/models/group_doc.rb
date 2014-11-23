class GroupDocValidator < ActiveModel::Validator
  def validate(record)
    if Document.where("id = '#{record.document_id}'").size == 0
      record.errors[:base] << "No such a record."
    end
    if Group.where("id = '#{record.group_id}'").size == 0
      record.errors[:base] << "No such a record."
    end
  end
end


class GroupDoc < ActiveRecord::Base
  
  belongs_to :document
  belongs_to :group
  
  validates :group_id, uniqueness: { scope: :document_id}, presence:true
  validates :document_id, uniqueness: { scope: :group_id}, presence:true
  
  validates_with GroupDocValidator
    
end
