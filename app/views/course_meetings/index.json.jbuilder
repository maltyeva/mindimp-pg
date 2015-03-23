json.array!(@course_meetings) do |course_meeting|
  json.extract! course_meeting, :id
  json.url course_meeting_url(course_meeting, format: :json)
end
