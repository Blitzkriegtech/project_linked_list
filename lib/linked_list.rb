# frozen_string_literal: true

# Node class representing each element in the linked list
class Node
    attr_accessor :value, :next_node

    def initialize(value = nil)
        @value = value
        @next_node = nil
    end
end

# LinkedList class managing the nodes
class LinkedList
    attr_reader :head, :tail, :size

    def initialize
        @head = nil
        @tail = nil
        @size = 0
    end

    # adds a new node at the end of the list
    def append(value)
        new_node = Node.new(value)
        if @head.nil?
            @head = new_node
        else
            @tail.next_node = new_node
        end
        @tail = new_node
        @size += 1
    end

    # adds a new node at the start of the list
    def prepend(value)
        new_node = Node.new(value)
        if @head.nil?
            @tail = new_node
        else
            new_node.next_node = @head
        end
        @head = new_node
        @size += 1
    end

    # returns the node at the given index
    def at(index)
        return nil if index < 0 || index >= @size

        current = @head
        index.times { current = current.next_node }
        current
    end

    # removes the last node from the list
    def pop
        return if @size.zero?

        if @size == 1
            @head = nil
            @tail = nil
        else
            current = @head
            current = current.next_node until current.next_node == @tail
            current.next_node = nil
            @tail = current
        end
        @size -= 1
    end

    # returns the index of the node containing the value, or nil if not found
    def find(value)
        current = @head
        index = 0
        while current
            return index if current.value == value

            current = current.next_node
            index += 1
        end
        nil
    end

    # represents the list as a string
    def to_s
        current = @head
        str = ''
        while current
            str += "( #{current.value} ) -> "
            current = current.next_node
        end
        str + 'nil'
    end

    # inserts a new node with the value at the given index
    def insert_at(value, index)
        return if index.negative? || index > @size

        if index.zero?
            prepend(value)
        elsif index == @size
            append(value)
        else
            prev_node = at(index - 1)
            new_node = Node.new(value)
            new_node.next_node = prev_node.next_node
            prev_node.next_node = new_node
            @size += 1
        end
    end

    # removes the node at the given index
    def remove_at(index)
        return if index.negative? || index >= @size

        if index.zero?
            @head = @head.next_node
            @tail = nil if @size - 1
        elsif index == @size - 1
            pop
            return
        else
            prev_node = at(index - 1)
            prev_node.next_node = prev_node.next_node.next_node
        end
        @size -= 1
    end
end

list = LinkedList.new

list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')

puts list
puts list.size