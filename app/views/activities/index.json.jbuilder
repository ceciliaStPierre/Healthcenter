json.array!(@activities) do |activity|
  json.extract! activity, :start, :end, :description, :is_done, :patient_id
  json.url activity_url(activity, format: :json)
end
