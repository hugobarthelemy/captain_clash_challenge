require 'database_cleaner'

DatabaseCleaner.clean_with :truncation

puts "Creating persos"
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
Perso.create!(name: "Pi", points_of_life: arr.sample, attack_points: arr.sample, picture_url: "http://lorempixel.com/400/400/cats/1")
Perso.create!(name: "Po", points_of_life: arr.sample, attack_points: arr.sample, picture_url: "http://lorempixel.com/400/400/cats/2")
Perso.create!(name: "To", points_of_life: arr.sample, attack_points: arr.sample, picture_url: "http://lorempixel.com/400/400/cats/3")
Perso.create!(name: "Potté", points_of_life: 10, attack_points: 10, picture_url: "http://img0.ndsstatic.com/raiponce/le-chat-potte-dans-shrek_123774_w620.jpg")
Perso.create!(name: "Ton", points_of_life: arr.sample, attack_points: arr.sample, picture_url: "http://lorempixel.com/400/400/cats/4")

# puts "create weapons"
# Weapon.create!(type_of_sort: "bouclier", name: "bouclier simple", point: 1)
# Weapon.create!(type_of_sort: "bouclier", name: "bouclier double", point: 2)
# Weapon.create!(type_of_sort: "bouclier", name: "super bouclier", point: 3)
# Weapon.create!(type_of_sort: "sort", name: "boule de poil", point: 2)
# Weapon.create!(type_of_sort: "sort", name: "herbe à chat", point: 1)
# Weapon.create!(type_of_sort: "sort", name: "Péritonite Infectieuse Féline", point: 4)

puts "Creating fights"
def create_fight
  winner = Perso.all.sample
  looser = Perso.all.sample
  Fight.create!(perso_id: winner[:id], winner: true)
  winner[:experience] =+ 1
  winner.save
  Fight.create!(perso_id: looser[:id], winner: false)
  p "winner is #{winner.name}"
end

50.times do
  create_fight
end

