class Element < ActiveRecord::Base
  belongs_to :dimension
  translates :description
end
