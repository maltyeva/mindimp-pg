json.array!(@discussion_responses) do |discussion_response|
  json.extract! discussion_response, :id
  json.url discussion_response_url(discussion_response, format: :json)
end
