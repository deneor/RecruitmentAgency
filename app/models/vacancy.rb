class Vacancy < ApplicationRecord
  has_and_belongs_to_many :skills, :join_table => 'vacancies_skills'
  include ContactInfoHelper
  scope :all_active, -> { where("? between start_date and end_date", Time.current).order(salary: :desc) }
  attr_accessor :skills_list

  def skills_list=(desired_skills)
    skills_to_add =[]
    desired_skills.split(',').each do |s|
      skills_to_add << (Skill.find_by_id(s) || Skill.create(name: s))
    end
    skills.delete(skills-skills_to_add)
    skills << skills_to_add-skills
  end
end
