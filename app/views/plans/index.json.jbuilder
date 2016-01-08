json.array!(@plans) do |plan|
  json.extract! plan, :start, :end, :owner_id
  json.url plan_url(plan, format: :json)
end
