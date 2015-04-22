json.array!(@article_sources) do |article_source|
  json.extract! article_source, :id
  json.url article_source_url(article_source, format: :json)
end
