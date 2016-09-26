require 'rails_helper'

RSpec.describe Vacancy, type: :model do
  employee=Employee.create(name: 'Иванов Иван Иванович', email: 'defauls@ex.ru', status: true)
  vacancy=Vacancy.create()
  it 'have employees' do
    employee.skills_list='sql,css,html'
    vacancy.skills_list='sql,css'
    expect(vacancy.employees.any?).to eq(true)
  end

  it 'have employees with 50% of skills' do
    employee.skills_list='sql,css'
    vacancy.skills_list='sql,css,html,js'
    vacancy.employees.select { |v| v.skills_rate>=0.5 }.any?
  end
  it 'havent employees' do
    employee.skills_list='sql'
    vacancy.skills_list='sql,css,html,js'
    !vacancy.employees.select { |v| v.skills_rate>=0.5 }.any?
  end
  it 'adding skills and they are good' do
    vacancy.skills_list=''
    vacancy.skills_list='css,html,csv,xml'
    expect(vacancy.skills.map(&:name)).to eq(["css", "html", "csv", "xml"])
  end
end
