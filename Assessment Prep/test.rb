def printer_error(s)
	# your code
  bad_letters = 0
  total_letters = s.length

  s.each_char do |letter|
    bad_letters += 1 if ('a'..'m').include?(letter) == false
  end
 puts "#{bad_letters}/#{total_letters}"
end

s="aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbmmmmmmmmmmmmmmmmmmmxyz"

printer_error(s)

s="aaaxbbbbyyhwawiwjjjwwm"
printer_error(s)
