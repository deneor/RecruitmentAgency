require 'rails_helper'

RSpec.describe Employee, type: :model do


  it 'raise error on unvalid name' do
    employee=Employee.new(name: 'Иванов Ivan Иванович')
    employee.validate
    employee.errors.include?(:name)
  end

  it 'raise error if no any contact infos' do
    employee=Employee.new(name: 'Иванов Иван Иванович')
    employee.validate
    employee.errors.include?(:contact_info)
  end

  employee=Employee.create(name: 'Иванов Иван Иванович', email: 'defauls@ex.ru')
  vacancy=Vacancy.create()
  it 'have vacancies' do
    employee.skills_list='sql,css,html'
    vacancy.skills_list='sql,css'
    employee.vacancies.any?
  end

  it 'have vacancies with 50% of skills' do
    employee.skills_list='sql,css'
    vacancy.skills_list='sql,css,html,js'
    employee.vacancies.select { |v| v.skills_rate>=0.5 }.any?
  end
  it 'havent vacancies' do
    employee.skills_list='sql'
    vacancy.skills_list='sql,css,html,js'
    !employee.vacancies.select { |v| v.skills_rate>=0.5 }.any?
  end
  it 'adding skills and they are good' do
    employee.skills_list='js'
    employee.skills_list='css,html,csv,xml'
    expect(employee.skills.map(&:name)).to eq(["css", "html", "csv", "xml"])
  end
end
