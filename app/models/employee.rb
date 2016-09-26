class Employee < ApplicationRecord
  has_and_belongs_to_many :skills
  include ContactInfoHelper
  include SkillsCompareHelper
  validates_format_of :name,
                      :with => /\A[а-яА-яёЁ]*\s*[а-яА-яёЁ]*\s*[а-яА-яёЁ]*\s*\z/,
                      message: 'Имя должно содержать 3 слова из кирилических букв и пробелов'
  validates :email,
            format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i},
            allow_blank: true
  validate :validate_if_have_any_contact
  scope :all_active, -> { where(status: true).order(desired_salary: :asc) }
  attr_accessor :skills_list
  attr_accessor :skills_rank

  def status_name
    status ? 'ищет' : 'занят'
  end

  def skills_list=(desired_skills)
    skills_to_add =[]
    desired_skills.split(',').each do |s|
      skills_to_add << (Skill.find_by_id(s) || Skill.find_or_create_by(name: s))
    end
    skills.delete(skills-skills_to_add)
    skills << (skills_to_add-skills)
  end

  def vacancies
    vacancies=Vacancy.all_active.joins(:skills).where("skill_id in (?)", skills.map(&:id)).distinct
    vacancies.each do |v|
      v.skills_rank=((v.skills & skills).count*1.0 / v.skills.count)
    end
    return vacancies
  end

  private

  def validate_if_have_any_contact
    if phone_number.blank? and email.blank?
      errors.add(:contact_info, "Необходимо заполнить поле номер телефона или адрес электронной почты")
    end
  end

end
