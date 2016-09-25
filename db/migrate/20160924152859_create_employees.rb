class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.boolean :status
      t.float :desired_salary
      t.string :phone_number
      t.string :email
      t.timestamps
    end
  end
end
