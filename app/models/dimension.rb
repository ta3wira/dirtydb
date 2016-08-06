class Dimension < ActiveRecord::Base
  has_many :elements, dependent: :destroy
  translates :title
end
