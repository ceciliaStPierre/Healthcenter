json.array!(@patients) do |patient|
  json.extract! patient, :firstname,  :father_lastname, :mother_lastname, :born_date, :sex,  :genogram_url, :record_url
  json.url patient_url(patient, format: :json)
end
