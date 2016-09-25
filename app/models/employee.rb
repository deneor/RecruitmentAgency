class Employee < ApplicationRecord
  has_and_belongs_to_many :skills
  include ContactInfoHelper
  validates_format_of :name, :with => /\A[а-яА-я]*\s*[а-яА-я]*\s*[а-яА-я]*\s*\z/, message: 'Имя должно содержать 3 слова из кирилических букв и пробелов'
  scope :all_active, -> { where(status: true).order(salary: :asc) }

  def status_name
    case status
      when true
        'ищу работу'
      else
        'занят'
    end
  end
end
