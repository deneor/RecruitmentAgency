json.extract! employee, :id, :name, :status, :desired_salary, :created_at, :updated_at
json.url employee_url(employee, format: :json)