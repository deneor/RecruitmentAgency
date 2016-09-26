class HomeController < ApplicationController
  def index
    @employees=Employee.all_active
    @vacancies=Vacancy.all_active
  end
end
