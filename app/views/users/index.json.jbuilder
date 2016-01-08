json.array!(@users) do |user|
  json.extract! user, :firstname, :secondname, :father_lastname, :mother_lastname, :phone_number, :speciality, :email, :password
  json.url user_url(user, format: :json)
end
