json.extract! customer, :id, :fullname, :phone, :email, :notes, :created_at, :updated_at
json.url customer_url(customer, format: :json)
