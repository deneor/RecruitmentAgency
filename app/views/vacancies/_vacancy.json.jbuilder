json.extract! vacancy, :id, :name, :start_date, :end_date, :salary, :created_at, :updated_at
json.url vacancy_url(vacancy, format: :json)