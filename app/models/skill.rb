class Skill < ApplicationRecord
  belongs_to :employee
  belongs_to :vacancy
  validates :name, :uniqueness => true
end
