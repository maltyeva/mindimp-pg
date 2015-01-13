json.array!(@book_categories) do |book_category|
  json.extract! book_category, :id
  json.url book_category_url(book_category, format: :json)
end
