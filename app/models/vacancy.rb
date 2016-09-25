class Vacancy < ApplicationRecord
  has_many :skills
  include ContactInfoHelper
  scope :all_active, -> { where("? between start_date and end_date", Time.current).order(salary: :desc) }
end
