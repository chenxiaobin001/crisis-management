json.array!(@documents) do |document|
  json.extract! document, :id, :document_name, :url
  json.url document_url(document, format: :json)
end
