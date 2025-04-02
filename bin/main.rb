# frozen_string_literal: true

require_relative '../lib/linked_list'
# test linked list
list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')

puts list
puts "Size: #{list.size}"
list.prepend('prepended')
puts "With preprended: #{list}"
puts "New size: #{list.size}"
puts "Head: #{list.head}"
puts "Tail: #{list.tail}"
puts "Value at index 4: #{list.at(4)}"
puts "Value at index 3: #{list.at(3)}"
puts "List contains 'prepended': #{list.contains?('prepended')}"
puts "Found: #{list.find('dog')}"
puts "Insert 'insert' at index 0: #{list.insert_at('insert', 0)}"
puts list
puts "New size: #{list.size}"
puts "Remove value at index 0: #{list.remove_at(0)}"
puts list
puts "New size: #{list.size}"
puts list
list.pop
puts list
puts list.size
