# 1
arr = ['10', '11', '9', '7', '8']

sorted_arr = arr.sort do |string1, string2|
  string2.to_i <=> string1.to_i
end

p sorted_arr

# 2
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

sorted_books = books.sort_by do |book|
  book[:published].to_i
end

p sorted_books

# 3
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
p arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
p arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
p arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
p hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
p hsh2[:third].key(0)

# 4
arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
p arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4
p arr2

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4
p hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4
p hsh2

# 5
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age = 0

munsters.each do |_, info|
  if info['gender'] == 'male'
    total_age += info['age']
  end
end

p total_age

# 6
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, info|
  puts "#{name} is a #{info["age"]}-year-old #{info["gender"]}"
end

# 7
a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# 8
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = 'aeiou'

hsh.each do |key, words|
  words.each do |word|
    word.downcase.chars.each do |letter|
      puts letter if vowels.include?(letter)
    end
  end
end

# 9
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

sorted_arr = arr.map do |sub_array|
  sub_array.sort do |a, b|
    b <=> a
  end
end

p sorted_arr

# 10
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr2 = arr.map do |hash|
         hash.map { |key, value| [key, value + 1]}.to_h
       end

p arr2

# 11
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

multiple3 = arr.map do |sub_arr|
  sub_arr.select do |int|
    int % 3 == 0
  end
end

p multiple3

# 12
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hash = arr.each_with_object({}) do |sub_arr, hash|
  hash[sub_arr[0]] = sub_arr[1]
end

p hash

# 13
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr_sorted = arr.sort_by do |sub_arr|
  sub_arr.select do |int| # the return value of #select is used
    int.odd?
  end
end

p arr_sorted

# 14
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

produce_hsh = hsh.map do |produce, info|
  if info[:type] == 'fruit'
    info[:colors].map do |color|
      color.capitalize
    end
  elsif info[:type] == 'vegetable'
    info[:size].upcase
  end
end

p produce_hsh

# 15
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

even_integers = arr.select do |hash|
                  hash.all? do |_, sub_array|
                    sub_array.all? do |int|
                      int.even?
                    end
                  end
                end

p even_integers

# 16
# first solution
def generate_uuid
  require 'securerandom'
  SecureRandom.uuid
end

puts generate_uuid

# second solution
def generate_uuid2
  hex_chars = []
  (0..9).each { |num| hex_chars << num.to_s }
  ('a'..'f').each { |letter| hex_chars << letter}

  uuid = ''

  pattern = [8, 4, 4, 4, 12]

  pattern.each do |order|
    order.times do
      uuid << hex_chars.sample
    end
    uuid += '-' unless pattern.index(order) == pattern.length - 1
  end

  uuid
end

puts generate_uuid2
