# Short Long Short
def short_long_short(str1, str2)
  return str1 + str2 + str1 if str1.length < str2.length
  return str2 + str1 + str2 if str1.length > str2.length
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"

# What Century is That?
def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
    century.to_s + suffix(century.to_s)
end

def suffix(century)
  last_digit = century[century.length - 1]
  if century.end_with?('11', '12', '13', '4', '5', '6', '7', '8', '9', '0')
    'th'
  else
    case last_digit
    when '1'
      'st'
    when '2'
      'nd'
    when '3'
      'rd'
    end
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

# Leap Years (pt2)
def leap_year?(year)
  if year > 1752
    (year % 400 == 0) || (year % 100 != 0 && year % 4 == 0)
  else
    year % 4 == 0
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

# Multiples of 3 and 5
def multisum(int)
  multisum = (1..int).inject do |sum, num|
    if num % 3 == 0 || num % 5 == 0
      sum + num
    else
      sum
    end
  end

  multisum -= 1
  # (1..int).each do |num|
  #   if num % 3 == 0 || num % 5 == 0
  #     sum += num
  #   end
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

# Running Totals
def running_total(arr)
  running_total = []
  arr.each_with_index do |num, index|
    sum = 0
    counter = 0
    (index + 1).times do
      sum += arr[counter]
      counter += 1
    end
    running_total << sum
  end
end

p running_total([2, 5, 13])
p running_total([14, 11, 7, 15, 20])
p running_total([3]) == [3]
p running_total([]) == []

# Convert a String to a Number!
INT_HASH = {'1' => 1, '2'=> 2, '3'=> 3, '4'=> 4, '5'=> 5, '6'=> 6, '7'=> 7, '8'=> 8, '9'=> 9}
def string_to_integer(str)
  total = 0
  counter = str.length
  str.split('').each do |num_string|
    if INT_HASH.keys.include?(num_string)
      total += INT_HASH[num_string] * 10 ** (counter-1)
      counter -= 1
    end
  end
  total
end

p string_to_integer('4321')
p string_to_integer('570')

# Hex to Int
HEX_HASH = INT_HASH.merge({
  'A' => 10,
  'B' => 11,
  'C' => 12,
  'D' => 13,
  'E' => 14,
  'F' => 15,
})

def hexadecimal_to_integer(hex_string)
  total = 0
  counter = hex_string.length
  hex_string = hex_string.upcase
  hex_string.split('').each do |digit|
    if HEX_HASH.keys.include?(digit)
      total += HEX_HASH[digit] * 16 ** (counter - 1)
      counter -= 1
    end
  end
  total
end

p hexadecimal_to_integer('4D9f') == 19871

# Convert a String to a Signed Number
def string_to_signed_integer(str)
  case str[0]
  when '-'
    -string_to_integer(str[1..-1])
  when '+'
    string_to_integer(str[1..-1])
  else
    string_to_integer(str)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570')
p string_to_signed_integer('+100')

# Convert a Number to a String!
INT_STRINGS = {
  0 => '0',
  1 => '1',
  2 => '2',
  3 => '3',
  4 => '4',
  5 => '5',
  6 => '6',
  7 => '7',
  8 => '8',
  9 => '9'
}
def integer_to_string(int)
  divmod_array = []
  int_array = []
  if int == 0
    divmod_array << int
  else
    while int > 0
      divmod_array << int.divmod(10)[1]
      int = int.divmod(10)[0]
    end
  end
  divmod_array.reverse!.each do |num|
    if INT_STRINGS.include?(num)
      int_array << INT_STRINGS[num]
    end
  end
  int_array.join
end

p integer_to_string(4321)
p integer_to_string(0)
p integer_to_string(5000)

# Convert a Signed Number to a String!
def signed_integer_to_string(int)
  divmod_array = []
  int_array = []
  int_placeholder = int
  if int == 0
    divmod_array << int
  elsif int > 0
    while int > 0
      divmod_array << int.divmod(10)[1]
      int = int.divmod(10)[0]
    end
  elsif int < 0
    int = -int
    while int > 0
      divmod_array << int.divmod(10)[1]
      int = int.divmod(10)[0]
    end
  end
  divmod_array.reverse!.each do |num|
    if INT_STRINGS.include?(num)
      int_array << INT_STRINGS[num]
    end
  end
  if int_placeholder > 0
    int_array.unshift('+')
  elsif int_placeholder < 0
    int_array.unshift('-')
  end
  int_array.join
end

p signed_integer_to_string(4321)
p signed_integer_to_string(-123)
p signed_integer_to_string(0)
