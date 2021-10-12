require 'pry-byebug'
class LinkedLists
    attr_accessor :next, :head, :tail
    def initialize(head=nil,tail=nil)
        @next = nil
        @head = nil
        @tail = nil

    end

    def append(value)
        if (@head == nil)
            @head = Node.new(value)
        else
            current_node = @head
         
        until current_node.next_node == nil
        current_node = current_node.next_node
        end
        current_node.next_node = Node.new(value)
        end
    end

end
class Node
    attr_accessor :value, :next_node
    def initialize(value=nil,next_node=nil) 
        @value = value
        @next_node = next_node
    end
    
end

p new_list = LinkedLists.new()
new_list.append(1)
new_list.append(2)
new_list.append(3)
new_list.append(4)
new_list.append(5)
new_list.append(6)

binding.pry
puts "hey"
