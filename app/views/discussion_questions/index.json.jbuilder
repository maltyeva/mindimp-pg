json.array!(@discussion_questions) do |discussion_question|
  json.extract! discussion_question, :id
  json.url discussion_question_url(discussion_question, format: :json)
end
