class Element < ActiveRecord::Base
  belongs_to :dimension
  has_many :scripts
  has_many :scenes, through: :scripts

  translates :description
end
