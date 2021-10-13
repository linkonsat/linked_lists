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

    def prepends(value)
        if (@head.next_node == nil)
            @head = Node.new(value)
        else
            new_head = Node.new(value)
            new_head.next_node = @head
            @head = new_head
        end
    end

    def size
        current_node = @head
        count = 1
        until current_node.next_node == nil
            count += 1
            current_node = current_node.next_node
        end
        return count
    end

    def head
        return @head.value
    end
  def tail
    current_node = @head
    until current_node.next_node == nil
      current_node = current_node.next_node
    end
    @tail = current_node
    return @tail
  end
  
  def at(index)
    current_index = 0
    if (index == 0)
        return @head    
    else
        current_index += 1
        current_node = @head.next_node
        unless current_index == index
            current_node = current_node.next_node
            current_index += 1
        end
        return current_node.value
    end
end

    def pop
        if(@head.next_node == nil)
            @head = nil
        else
            current_node = @head.next_node
            while current_node.next_node.next_node != nil
                current_node = current_node.next_node
            end
            
            current_node.next_node = nil
            if (@tail != nil)
                @tail = nil
            end
        end
    end

    def find(value)
    index = 0
        current_node = @head
  
    until current_node.next_node == nil || current_node.value == value
        current_node = current_node.next_node
      index += 1
      end
      if (current_node.next_node == nil)
        return nil
      elsif (current_node.value == value)
        return "found value #{value} at index of #{index}"
      else
    end
    end
    
    def to_s
        objects_to_strings = "( #{@head.value} ) ->"
        current_node = @head
        until  current_node.next_node == nil
            objects_to_strings << "( #{current_node.next_node.value} ) -> "
            current_node = current_node.next_node
        end
        p objects_to_strings
    end

    def insert_at(value,index)
        current_index = 0
        current_node = @head 
        until current_index == index 
            current_node = current_node.next_node
            current_index += 1
        end
        new_entry = Node.new(value)
        new_entry.next_node = current_node.next_node
        current_node.next_node = new_entry 
    end

    def remove_at(index)
        if (index == 0)
            @head = @head.next_node
        end
        current_index = 1
        current_node = @head
        until current_index == index 
            current_node = current_node.next_node
            current_index += 1
        end
       current_node.next_node = current_node.next_node.next_node
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
new_list.prepends("^__^")
new_list.prepends("THIS WORKED")
size = new_list.size
head = new_list.head
tail = new_list.tail
new_list.at(3)
result = new_list.find(10)
new_list.pop
p new_list.to_s
binding.pry

puts "hey"
