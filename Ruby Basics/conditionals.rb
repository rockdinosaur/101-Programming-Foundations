# 1
sun = ['visible', 'hidden'].sample

puts "The sun is so bright!" if sun == 'visible'
puts "The clouds are blocking the sun!" unless sun == 'visible'

# True or false
boolean = [true, false].sample

boolean ? puts("I'm true!") : puts("I'm false")

#Stoplight (pt1)
stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green'
  puts "GO!"
when 'yellow'
  puts "slow down!"
when 'red'
  puts "STOP!"
end

# Sleep Alert
status = ['awake', 'tired'].sample

alert = if status == 'awake'
          'Be productive'
        else
          'Go sleep!'
        end
puts alert

#stoplight (pt3)
case stoplight
when 'green' then  puts 'Go!'
when 'yellow' then puts 'Slow down!'
else               puts 'Stop!'
end
