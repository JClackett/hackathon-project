json.array!(@results) do |result|
  json.extract! result, :id, :doctor_id, :patient_id, :status, :raw_data, :notes
  json.url result_url(result, format: :json)
end
