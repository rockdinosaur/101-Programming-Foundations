# 1 Fizzbuzz

def fizzbuzz(num1, num2)
  fb_array = []
  loop do
    if num1 % 15 == 0
      fb_array << "FizzBuzz"
    elsif num1 % 3 == 0
      fb_array << "Fizz"
    elsif num1 % 5 == 0
      fb_array << "Buzz"
    else
      fb_array << num1
    end
    num1 += 1
    break if num1 >= num2
  end
  puts fb_array.join(", ")
end

fizzbuzz(5, 25)

# 2 Laptop Search
PRODUCTS = [
  { name: "Thinkpad x210",   price: 220 },
  { name: "Thinkpad x220",   price: 250 },
  { name: "Thinkpad x250",   price: 979 },
  { name: "Thinkpad x230",   price: 300 },
  { name: "Thinkpad x230",   price: 330 },
  { name: "Thinkpad x230",   price: 350 },
  { name: "Thinkpad x240",   price: 700 },
  { name: "Macbook Leopard", price: 300 },
  { name: "Macbook Air",     price: 700 },
  { name: "Macbook Pro",     price: 600 },
  { name: "Macbook",         price: 1449 },
  { name: "Dell Latitude",   price: 200 },
  { name: "Dell Latitude",   price: 650 },
  { name: "Dell Inspiron",   price: 300 },
  { name: "Dell Inspiron",   price: 450 }
]

query = {
  price_min: 240,
  price_max: 280,
  q: "thinkpad"
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: "dell"
}

# def search(query)
#   #implementation goes here
#   selected_laptop = []
#   PRODUCTS.each do |laptop|
#     if laptop[:name].downcase.include?(query[:q]) && laptop[:price] >= query[:price_min] && laptop[:price] <= query[:price_max]
#       selected_laptop << laptop
#     end
#   end
#   p selected_laptop
# end

def search(query)
  selected_laptop = PRODUCTS.select do |laptop|
    laptop[:name].downcase.include?(query[:q]) && (query[:price_min]..query[:price_max]).include?(laptop[:price])
  end
  p selected_laptop
end

search(query)
# [ { name: "Thinkpad x220", price: 250 } ]

search(query2)
# [ { name: "Dell Inspiron", price: 300},
#  { name: "Dell Inspiron", price: 450}]

# 3 Vowel Removal Method

# ** input **
# ['green', 'yellow', 'black', 'white']

# ** output **
# ['grn', yllw', 'blck', 'wht']

def remove_vowels(array)
  array.map do |word|
    word.delete "aeiou"
  end
end

VOWELS = ['a', 'e', 'i', 'o', 'u']
def remove_vowels2(array)
  array.map do |string|
    chars = string.split("")
    VOWELS.each do |vowel|
      chars.delete(vowel)
    end
    chars.join("")
  end
end

p remove_vowels(['green', 'yellow', 'black', 'white'])
p remove_vowels2(['green', 'yellow', 'black', 'white'])
