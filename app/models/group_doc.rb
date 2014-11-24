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
#   The Rails default behaviour is that the column used to hold the foreign key on a model is the
#   name of the association with the suffix _id added. The :foreign_key option lets you set the name
#   of the foreign key directly.
#  belongs_to :document, :foreign_key => :document_id
#  belongs_to :group, :foreign_key => :group_id
  belongs_to :document
  belongs_to :group
  self.primary_keys = :document_id, :group_id
  validates :group_id, uniqueness: { scope: :document_id}, presence:true
  validates :document_id, uniqueness: { scope: :group_id}, presence:true
  
  validates_with GroupDocValidator
    
end
