require_relative "./lib/garment"

files = Dir["#{__dir__}/data/*.txt"]

wardrobe = files.map { |file| Garment.from_file(file) }

puts "Сколько градусов за окном? (можно с минусом)"
temp = STDIN.gets.to_i

suitable_garments =
  wardrobe.select { |garment| garment.suits_for?(temp) }

uniq_suitable_garments =
  suitable_garments.uniq { |garment| garment.type }

uniq_suitable_garments.each { |garment| puts garment }

