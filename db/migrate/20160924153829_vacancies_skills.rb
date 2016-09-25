class VacanciesSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :vacancies_skills do |t|
      t.integer :vacancy_id
      t.integer :skill_id
    end
  end
end
