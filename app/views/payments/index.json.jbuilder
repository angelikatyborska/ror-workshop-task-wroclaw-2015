json.array!(@payments) do |payment|
  json.extract! payment, :id, :amount, :student_id, :date
  json.url payment_url(payment, format: :json)
end
