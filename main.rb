require './lib/LinkedList.rb'

list = LinkedList.new
list.append(9)
list.append(10)
list.append(20)
list.append(25)
list.append(45)
list.prepend(0)
list.prepend(2)
puts "|--- Size ---|\n#{list.size}"
list.prepend(10)
list.prepend(2)
list.prepend(3)
list.append(2)
list.append(45)
list.append(40)
puts "|--- Size ---|\n#{list.size}"

puts "|-- contains 2 = #{list.contains?(2)} --|"
puts "|-- contains 45 = #{list.contains?(45)} --|"
puts "|-- contains 20 = #{list.contains?(20)} --|"
puts "|-- contains 9 = #{list.contains?(9)} --|"
puts "|-- contains 1 = #{list.contains?(1)} --|\n"

puts '|---  ELEMENTS ---|'
for i in (0...list.size)
  puts "#{i} : #{list.at(i).value}"
end