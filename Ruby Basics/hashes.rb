#1 First car
car = {
  type: 'sedan',
  color: 'blue',
  mileage: 80_000
}

#2 Adding the Year
car[:year] = 2003

#3 Broken Odomoeter
car.delete(:mileage)

#4 What Color?
puts car[:color]

#5 Labeled numbers
numbers = {
  high:   100,
  medium: 50,
  low:    10
}

numbers.each do |key, value|
  puts "#a {key} value is #{value}"
end

#6 Divided by Two
half_numbers = numbers.map do |key, value|
  value / 2
end

p half_numbers

#7 Low, Medium, or High?

low_numbers = numbers.select! do |key, value|
  value < 25
end

p low_numbers
p numbers

#8 Multiple Cars

vehicles = {
  Car: {
    type: 'sedan',
    color: 'blue',
    year: 2003
  },
  Truck: {
    type: 'pickup',
    color: 'red',
    year: 1998
  }
}
puts vehicles[:Truck]

#9 Which Collection?

car = [[:type,'sedan'], [:color, 'blue'], [:year, '2003']]
puts car
