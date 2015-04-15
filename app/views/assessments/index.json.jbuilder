json.array!(@assessments) do |assessment|
  json.extract! assessment, :id
  json.url assessment_url(assessment, format: :json)
end
