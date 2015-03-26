json.array!(@course_files) do |course_file|
  json.extract! course_file, :id
  json.url course_file_url(course_file, format: :json)
end
