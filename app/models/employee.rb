class Employee < ApplicationRecord
  has_and_belongs_to_many :skills
  include ContactInfoHelper
  validates_format_of :name, :with => /\A[а-яА-я]*\s*[а-яА-я]*\s*[а-яА-я]*\s*\z/, message: 'Имя должно содержать 3 слова из кирилических букв и пробелов'
end
