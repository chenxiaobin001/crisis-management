json.array!(@group_docs) do |group_doc|
  json.extract! group_doc, :id, :group_id, :document_id
  json.url group_doc_url(group_doc, format: :json)
end
