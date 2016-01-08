json.array!(@patients) do |patient|
  json.extract! patient, :firstname, :secondname, :father_lastname, :mother_lastname, :born_date, :sex, :home_adress, :phone_number, :contact_number, :genogram_url, :record_url
  json.url patient_url(patient, format: :json)
end
