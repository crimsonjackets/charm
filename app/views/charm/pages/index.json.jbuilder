json.array! @pages do |page|
  json.extract! page, :path, :published, :published_at, :template, :heading, :body
  json.url page_url(page, format: :json)
end
