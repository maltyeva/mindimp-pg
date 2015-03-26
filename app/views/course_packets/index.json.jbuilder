json.array!(@course_packets) do |course_packet|
  json.extract! course_packet, :id
  json.url course_packet_url(course_packet, format: :json)
end
