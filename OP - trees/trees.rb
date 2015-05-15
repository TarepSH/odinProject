#recursive method
require './node'

class BST
	attr_accessor :root

	def initialize(root = nil)
		@root = root
	end


	def BST.build_tree(array)
		bst = BST.new
		array.each {|data| bst.add(data)}
	end

	def add(data)
		if @root == nil
			@root = Node.new(data)
		else
			add_to_bst(Node.new(data), @root)
		end
	end

	def add_to_bst(node, ancestor)
		if ancestor.nil?
			return node
		end

		node.parent = ancestor
		if node.value < ancestor.value
			ancestor.left_child = add_to_bst(node, ancestor.left_child)
		elsif node.value > ancestor.value
			ancestor.right_child = add_to_bst(node, ancestor.right_child)
		end

	end

	def bfs target
		queue = [@root]
		until queue.empty?
			current = queue.shift
			return current if current == target
			queue.push current.left_child unless current.left_child.nil?
			queue.push current.right_child unless current.right_child.nil?
		end
		nil

	end

end


# #manual sort of sortable dataset
# def build_tree(array)
# 		array = array.sort

# 		puts "Building this array: #{array}"
# 		puts "Length of this array: #{array.length}"

# 		@root = Node.new(array.length/2)
# 		puts ""
# 		print "Initializing node with value of: #{@root.value}"
# 		puts ""

# 		 left = array[1..array.length/2-1]
# 		 right = array[array.length/2-1..-1]
# 		 puts "Splitting arrray..."
# 		 puts ""
# 		 puts "Left: #{left}"
# 		 puts ""
# 		 puts "Right: #{right}"
# 		 puts ""

# 		 #move down the left array first
# 		 current_node = @root
# 		 puts "Current node: #{current_node.value}"

# 		 left.reverse_each do |value|
# 		 	if (value < current_node.value) && (current_node.left == nil)
# 		 		left = Node.new(value, current_node)
# 				current_node.left = left
# 				puts "Current Node: #{current_node.value}, Current Node Left: #{left.value}, Current Node Right: #{!left.right.nil?}"
# 				current_node = left
# 				puts "Current Node Changed To: #{current_node.value}"
# 			else
# 				puts "Returning for value #{value}"
# 			end

# 		 end

# 		 current_node = @root
# 		 right.each do |value|
# 		 	if (value > current_node.value) && (current_node.right == nil)
# 		 		right = Node.new(value, current_node)
# 				current_node.right = right
# 				puts "Current Node: #{current_node.value}, Current Node Left: #{!right.right.nil?}, Current Node Right: #{right.value}"
# 				current_node = right
# 				puts "Current Node Changed To: #{current_node.value}"
# 			else
# 				puts "Returning for value #{value}"
# 			end
# 		end
# 	end
# end

# build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])




a = BST.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
a.bfs 1