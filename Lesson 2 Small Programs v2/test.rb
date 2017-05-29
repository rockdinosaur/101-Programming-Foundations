# 1
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hash = flintstones.each_with_object({}) do |flintstone, hash|
  hash[flintstone] = flintstones.index(flintstone)
end

p hash

# 2
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

total_age = 0

ages.each { |_, age| total_age += age }

p total_age

# 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

removed_old_people = ages.reject do |_, age|
                       age >= 100
                     end

p removed_old_people

# 4
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.sort[0]

# 5
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index do |name, index|
  puts index if name.start_with?("Be")
end

# 6
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

shortened = flintstones.map do |name|
            name[0, 3]
            end

p shortened

# 7
statement = "The Flintstones Rock"

hash = {}

statement.each_char do |letter|
  hash[letter] = statement.count(letter)
end

p hash

statement = "The Flintstones Rock"

# 9
words = "the flintstones rock"

titalized_words = words.split(' ').map do |word|
  word.capitalize
end

p titalized_words

# 10
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

modified_munsters = munsters.each do |name, info|
  case info["age"]
  when 0..17
    info["age_group"] = 'kid'
  when 18..64
    info["age_group"] = 'adult'
  when 65..Float::INFINITY
    info["age_group"] = 'senior'
  end
end

p modified_munsters
