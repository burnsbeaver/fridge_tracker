require_relative '../config/environment'
require_relative '../app/models/fridge'

puts "test"

loop do
  puts "Enter an option:"
  puts "A) List all Fridges"
  puts "B) Create new Fridge"
  puts "C) Remove a Fridge"
  option = gets.chomp
  puts "You selected #{option}"

  if option.upcase == 'A'
    all_fridges = Fridge.all
    all_fridges.each_with_index do |fridge|
      puts fridge.location
    end
  elsif option.upcase == 'B'
    puts "Enter Fridge Location"
    location = gets.chomp.capitalize
    puts "Fridge Brand?"
    brand = gets.chomp.capitalize
    puts "Fridge size?"
    size = gets.chomp.capitalize
    puts "#{location} #{brand} #{size} thank you"
    Fridge.create(location: location, brand: brand, size: size)
  elsif option.upcase == 'C'
    puts "Which Fridge would you like to remove? Enter Location"
    fridge_to_remove = gets.chomp.capitalize
    puts "Removing #{fridge_to_remove}"
    Fridge.find_by(location: fridge_to_remove).destroy
    puts "Fridge is gone motha fucka"
  elsif option.upcase == "QUIT" || "EXIT"
    break
  end
end
