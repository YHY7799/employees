json.extract! employee, :id, :name, :salary, :allowance, :comment, :created_at, :updated_at
json.url employee_url(employee, format: :json)
