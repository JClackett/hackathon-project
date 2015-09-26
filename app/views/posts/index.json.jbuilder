json.array!(@posts) do |post|
  json.extract! post, :id, :patient_id, :location, :discomfort, :frequency, :initial_occurence, :notes
  json.url post_url(post, format: :json)
end
