class Vacancy < ApplicationRecord
  has_and_belongs_to_many :skills, :join_table => 'vacancies_skills'
  include ContactInfoHelper
  scope :all_active, -> { where("? between start_date and end_date", Time.current).order(salary: :desc) }
  attr_accessor :skills_list
  attr_accessor :skills_rank

  def skills_list=(desired_skills)
    skills_to_add =[]
    desired_skills.split(',').each do |s|
      skills_to_add << (Skill.find_by_id(s) || Skill.find_or_create_by(name: s))
    end
    skills.delete(skills-skills_to_add)
    skills << (skills_to_add-skills)
  end

  def employees
    employees=Employee.all_active.joins(:skills).where("skill_id in (?)", skills.map(&:id)).distinct
    employees.each do |v|
      v.skills_rank=((v.skills & skills).count*1.0 / skills.count)
    end
    return employees
  end
end
