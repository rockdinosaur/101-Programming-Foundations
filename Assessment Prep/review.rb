# Selection & Transformation Practice
# def general_select(produce, selection)
#   produce.select do |fruit_veg, type|
#     type == selection
#   end
# end

def general_select(produce, selection)
  produce_type = produce.values
  produce_name = produce.keys
  counter = 0
  selected_produce = {}
  loop do
    if produce_type[counter] == selection
      selected_produce[produce_name[counter]] = produce_type[counter]
    end
    counter += 1
    break if counter == produce.length
  end
  selected_produce
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p general_select(produce, 'Fruit')     # => {"apple"=>"Fruit", "pear"=>"Fruit"}
p general_select(produce, 'Vegetable') # => {"carrot"=>"Vegetable", "broccoli"=>"Vegetable"}
p general_select(produce, 'Meat')      # => {}
#---------------------------------------------------------------------------------------------
def select_letter(string, char)
  char_string = ''
  string.count(char).times do
    char_string << char
  end
  char_string
end

question = 'How many times does a particular character appear in this sentence?'
p select_letter(question, 'a') # => "aaaaaaaa"
p select_letter(question, 't') # => "ttttt"
p select_letter(question, 'z') # => ""

#---------------------------------------------------------------------------------------------
PRODUCTS = [
  { name: "Thinkpad x210", price: 220 },
  { name: "Thinkpad x220", price: 250 },
  { name: "Thinkpad x250", price: 979 },
  { name: "Thinkpad x230", price: 300 },
  { name: "Thinkpad x230", price: 330 },
  { name: "Thinkpad x230", price: 350 },
  { name: "Macbook Leopard", price: 300 },
  { name: "Macbook Air", price: 700 },
  { name: "Macbook Pro", price: 600 },
  { name: "Macbook", price: 1449 },
  { name: "Dell Latitude", price: 200 },
  { name: "Dell Latitude", price: 650 },
  { name: "Dell Inspiron", price: 300 },
  { name: "Dell Inspiron", price: 450 }
]

query = {
  price_min: 240,
  price_max: 280,
  q: "thinkpad"
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: 'dell'
}

def search(query)
  PRODUCTS.select do |computer|
    computer[:name].downcase.include?(query[:q]) && (computer[:price] >= query[:price_min] && computer[:price] <= query[:price_max])
  end
end

p search(query)
# [{ name: "Thinkpad x220", price: 250}]
p search(query2)
# [{name: "Dell Inspiron", price: 300},
#  {name: "Dell Inspiron", price: 450}]
#---------------------------------------------------------------------------------------------
# Practice Problem 1
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end
p flintstones_hash

flintstones_hash2 = flintstones.each_with_object({}) do |name, hash|
  hash[name] = flintstones.index(name)
end
p flintstones_hash2

# Practice Problem 2
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.inject(:+)

# Practice Problem 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if {|key, value| value > 100}
p ages

# Practice Problem 4
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.sort[0]

# Practice Problem 5
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.each_with_index do |name, index|
  if name.start_with?("Be")
    puts index
  end
end

# Practice Problem 6
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
shortened = flintstones.map do |name|
  name[0, 3]
end

p shortened

# Practice Problem 7
statement = "The Flintstones Rock"

letter_count = statement.split.join.chars.each_with_object({}) do |letter, hash|
  hash[letter] = statement.count(letter)
end

p letter_count

# Practice Problem 9
words = "the flintstones rock"

def titleize(str)
  str.split.map {|word| word.capitalize}.join(' ')
end

p titleize(words)

# Practice Problem 10
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# munsters.each do |member, info|
#   info['age_group'] = 'kid' if info['age'] >= 0 && info['age'] <= 17
#   info['age_group'] = 'adult' if info['age'] >= 18 && info['age'] <= 64
#   info['age_group'] = 'senior' if info['age'] >= 65
# end

munsters.each do |member, info|
  case info['age']
  when 0..18
    info['age_group'] = 'kid'
  when 18..65
    info['age_group'] = 'adult'
  else
    info['age_group'] = 'senior'
  end
end

p munsters

# Example 8
selected = [[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |subarray|
  subarray.select do |element|
    if element.to_s.to_i == element
      element > 13
    else
      element.length < 6
    end
  end
end

p selected

# Example 10
incremented = [[[1, 2], [3, 4]], [5, 6]].map do |element1|
  element1.map do |element2|
    if element2.to_s.size == 1
      element2 + 1
    else
      element2.map do |element3|
        element3 + 1
      end
    end
  end
end

p incremented

# Practice Problem 1
arr = ['10', '11', '9', '7', '8'].sort do |a, b|
  b.to_i <=> a.to_i
end


# Practice Problem 2
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

sorted_books = books.sort_by {|book| book[:published].to_i}
p sorted_books

# Practice Problem 3
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

p arr1[2][1][3]
p arr2[1][:third][0]
p arr3[2][:third][0][0]
p hsh1['b'][1]
p hsh2[:third].keys[0]

# Practice Problem 4
arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

arr1[1][1] = 4
p arr1

arr2[2] = 4
p arr2

hsh1[:first][2][0] = 4
p hsh1

hsh2[['a']][:a][2] = 4
p hsh2

# Practice Problem 5
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

male_age_total = 0
munsters.each do |name, info|
  male_age_total += info['age'] if info['gender'] == 'male'
end

p male_age_total

# Practice Problem 6
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, info|
  puts "#{name} is a #{info['age']}-year-old #{info['gender']}."
end

# Practice Problem 8
VOWELS = 'aeiou'

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key, array|
  array.each do |word|
    word.chars.each do |letter|
      puts letter if VOWELS.include?(letter)
    end
  end
end

# Practice Problem 9
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
arr.map! do |subarray|
  subarray.sort do |a, b|
    b <=> a
  end
end

p arr

# Practice Problem 10
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr_incremented = arr.map do |hsh|
  hsh.map do |key, value|
    value + 1
  end
end

p arr_incremented
p arr

# Practice Problem 11
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr_multiples_of_3 = arr.map do |subarray|
  subarray.reject do |num|
    num % 3 != 0
  end
end

p arr_multiples_of_3

# Practice Problem 12
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

arr_to_hash = arr.each_with_object({}) do |subarray, hash|
  hash[subarray[0]] = subarray[1]
end

p arr_to_hash

# Practice Problem 13
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

sorted_arr = arr.sort_by do |subarray|
  subarray.select do |num|
    num.odd?
  end
end

p sorted_arr

# Practice Problem 14
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

fruit_veg = hsh.map do |produce, info|
  if info[:type] == 'fruit'
    info[:colors].map do |color|
      color.capitalize
    end
  else
    info[:size].upcase
  end
end

p fruit_veg

# 15
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr2 = arr.select do |hsh|
  hsh.all? do |key, value|
    value.all? do |num|
      num.even?
    end
  end
end

p arr2
