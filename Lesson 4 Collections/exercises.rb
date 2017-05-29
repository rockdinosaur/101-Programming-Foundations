# 1
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}
counter = 0

loop do
  flintstones_hash[flintstones[counter]] = counter
  counter += 1
  break if counter >= flintstones.length
end

p flintstones_hash

# 2
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

total_age = 0
ages.each do |key, value|
  total_age += value
end

p total_age

# 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.reject! do |_, value|
  value >= 100
end

p ages

# 4
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.min

# 5
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each do |member|
  if member.start_with?("Be")
    p flintstones.index(member)
  end
end

# 6
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones = flintstones.map do |member|
  member[0, 3]
end

p flintstones

# 7
statement = "The Flintstones Rock"

statement_array = statement.chars

letter_frequency = statement_array.each_with_object({}) do |letter, hash|
  hash[letter] = statement_array.count(letter)
end

p letter_frequency

# 9
def titeize(string)
  string_array = string.chars
  string_array[0].upcase!
  string_array.each_with_index do |letter, index|
    if letter == " "
      string_array[index + 1].upcase!
    end
  end
end

words = "the flintstones rock"
p titeize(words).join

# 10
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, info|
  if info["age"] >= 0 && info["age"] <= 17
    info["age_group"] = "kid"
  elsif info["age"] >= 18 && info["age"] <= 64
    info["age_group"] = "adult"
  else
    info["age_group"] = "senior"
  end
end

p munsters
