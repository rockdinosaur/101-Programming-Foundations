# Combine Two Lists

def interleave(arr1, arr2)
  interleaved_array = []
  counter = 0
  loop do
    interleaved_array << arr1[counter]
    interleaved_array << arr2[counter]
    counter += 1
    break if counter == arr1.length || counter == arr2.length
  end
  interleaved_array
end

def interleave2(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
p interleave2([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# Lettercase Counter

def letter_case_count(str)
  hash = Hash.new(0)
  hash = {lowercase: 0, uppercase: 0, neither: 0}
  str.chars.each do |char|
    hash[:uppercase] += 1 if ('A'..'Z').include?(char)
    hash[:lowercase] += 1 if ('a'..'z').include?(char)
    hash[:neither] += 1 if !('A'..'Z').include?(char) && !('a'..'z').include?(char)
  end
  hash
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# Capitalize Words

def word_cap(str)
  str.split.map {|word| word.capitalize}.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Swap Case

def swapcase(str)
  swapped_case_array = str.split('').map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  swapped_case_array.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# Staggered Caps (Part 1)

def staggered_case(str)
  staggered_str = ''
  str.chars.each_with_index do |char, index|
    staggered_str << char.upcase if index.even?
    staggered_str << char.downcase if index.odd?
  end
  staggered_str
end

p staggered_case('I Love Launch School!')
p staggered_case('ALL_CAPS')
p staggered_case('ignore 77 the 444 numbers')

# Staggered Caps (Part 2)
def staggered_case2(str)
  counter = 0
  staggered_str = ''

  str.chars.each do |char|
    if ('a'..'z').include?(char) || ('A'..'Z').include?(char)
      staggered_str << char.upcase if counter.even?
      staggered_str << char.downcase if counter.odd?
      counter += 1
    else
      staggered_str << char
    end
  end
  staggered_str
end

p staggered_case2('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case2('ALL CAPS') == 'AlL cApS'
p staggered_case2('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Multiplicative Average
def show_multiplicative_average(arr)
  (arr.inject(:*).to_f/arr.length).round(3)
end

p show_multiplicative_average([3, 5]) == 7.500

p show_multiplicative_average([6]) == 6.000

p show_multiplicative_average([2, 5, 7, 11, 13, 17]) == 28361.667

# Multiply Lists
def multiply_list(arr1, arr2)
  product_arr = []
  arr1.each_with_index do |num, index|
    product_arr << (num * arr2[index])
  end
  product_arr
end

def multiply_list2(arr1, arr2)
  arr1.zip(arr2).map {|subarr| subarr.inject(:*)}
end
p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
p multiply_list2([3, 5, 7, 10], [9, 10, 11, 20]) == [27, 50, 77, 200]

# Multiply All Pairs
def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map {|subarr| subarr.inject(:*)}.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# The End is Near But Not Here

def penultimate(str)
  str.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
