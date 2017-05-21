# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def rand_word(*vals)
  return (0...8).map { (65 + rand(26)).chr }.join + "___#{vals.map{|i| i.to_s.rjust(3, '0')}.join}"
end

total_scenes = 6
total_dimensions = 3
total_elements = 8
scene_length = 15 #mins
sampling = 60 #sec

total_dimensions.times do |i|
  d = Dimension.create({title: rand_word(i)})
  total_elements.times do |j|
    Element.create({dimension: d ,description: rand_word(i, j)})
  end
end


total_scenes.times do |i|
  scene = Scene.create({length: scene_length, sampling: sampling, title: rand_word(i)})
  Dimension.all.each do |dimension| # for now create for each dimension
    (scene_length * 60 / sampling).times do |j|
      Script.create({scene: scene, element: dimension.elements.sample, sequence: j})
    end
  end
end
