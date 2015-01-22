json.array!(@course_periods) do |course_period|
  json.extract! course_period, :id
  json.url course_period_url(course_period, format: :json)
end
