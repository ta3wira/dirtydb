class Scene < ActiveRecord::Base
  translates :title
  has_many :scripts
  has_many :elements, through: :scripts
end
