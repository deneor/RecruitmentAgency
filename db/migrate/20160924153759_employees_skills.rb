class EmployeesSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :employees_skills do |t|
      t.integer :employee_id
      t.integer :skill_id
    end
  end
end
