json.array!(@course_categories) do |course_category|
  json.extract! course_category, :id
  json.url course_category_url(course_category, format: :json)
end
