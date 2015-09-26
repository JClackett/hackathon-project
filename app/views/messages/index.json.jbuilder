json.array!(@messages) do |message|
  json.extract! message, :id, :doctor_id, :patient_id, :content
  json.url message_url(message, format: :json)
end
