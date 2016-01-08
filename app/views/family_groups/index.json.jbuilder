json.array!(@family_groups) do |family_group|
  json.extract! family_group, :family_name
  json.url family_group_url(family_group, format: :json)
end
