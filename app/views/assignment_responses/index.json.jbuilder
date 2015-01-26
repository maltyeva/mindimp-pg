json.array!(@assignment_responses) do |assignment_response|
  json.extract! assignment_response, :id
  json.url assignment_response_url(assignment_response, format: :json)
end
