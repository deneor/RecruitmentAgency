class CreateVacancies < ActiveRecord::Migration[5.0]
  def change
    create_table :vacancies do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.float :salary
      t.string :phone_number
      t.string :email
      t.timestamps
    end
  end
end
