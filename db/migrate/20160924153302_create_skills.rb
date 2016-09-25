class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.string :name

      t.timestamps
    end
    add_index :skills, :name, unique: true
  end
end