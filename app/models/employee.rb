class Employee < ApplicationRecord
  has_and_belongs_to_many :skills
  include ContactInfoHelper
  validates_format_of :name, :with => /\A[а-яА-я]*\s*[а-яА-я]*\s*[а-яА-я]*\s*\z/, message: 'Имя должно содержать 3 слова из кирилических букв и пробелов'
  scope :all_active, -> { where(status: true).order(salary: :asc) }
  attr_accessor :skills_list

  def status_name
    status ? 'ищет' : 'занят'
  end

  def skills_list=(desired_skills)
    skills_to_add =[]
    desired_skills.split(',').each do |s|
      skills_to_add << (Skill.find_by_id(s) || Skill.create(name: s))
    end
    skills.delete(skills-skills_to_add)
    skills << skills_to_add-skills
  end

end
