# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def rand_word(l=8)
  return (0...l).map { (65 + rand(26)).chr }.join
end



(1..3).each do |i|
  @d = Dimension.create({title: rand_word})
  (1..8).each do |j|
    @e = Element.create({dimension_id: @d['id'] ,description: rand_word(12)})
  end
end


all_e = Element.pluck(:id)
(1..6).each do |i|
  @s = Scene.create({length: 10, title: rand_word})
  (1..10).each do |j|
    Script.create({scene_id: @s['id'] ,element_id: all_e.sample, sequence: j})
  end
end
