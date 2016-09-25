class Vacancy < ApplicationRecord
  has_many :skills
  include ContactInfoHelper
end
