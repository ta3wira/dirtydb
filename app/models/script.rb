class Script < ActiveRecord::Base
  belongs_to :element
  belongs_to :scene

  scope :by_dimensions, -> (scene_id) {select('scripts.*, elements.*, element_translations.*').where(scene_id: scene_id).joins(:element).joins(element: :translations).order('dimension_id DESC').order('sequence ASC')}
end
