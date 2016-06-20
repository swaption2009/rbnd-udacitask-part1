require_relative 'todolist.rb'

# Creates a new todo list
puts "Welcome to Udacitask! Please enter a name for your list: "
new_name = gets.chomp.to_s
my_list = ToDoList.new(new_name)
puts "Thank you! You've created " + new_name + " to-do list"

# Add four new items
puts "How many to-do items do you have?"
number_of_items = gets.chomp.to_i
number_of_items.times do |item|
  puts "Enter your to-do item: "
  to_do_item = gets.chomp.to_s
  my_list.add_item(to_do_item)
end

# Print the list
my_list.print_list

# Delete the first item
my_list.delete_item

# Print the list
my_list.print_list

# Delete the second item
my_list.delete_item

# Print the list
my_list.print_list

# Update the completion status of the first item to complete
my_list.change_status!

# Print the list
my_list.print_list

# Update the title of the list
puts "Enter a new name of the list: "
my_list.title = gets.chomp.to_s

# Print the list
my_list.print_list

# print completed? method
puts "The task for " + my_list.items[0].description + " is completed? " +  my_list.items[0].completed?.to_s

# Feature 1: shows how many items are completed vs total
my_list.progress_report

# Feature 2: sort ToDoList by item description
puts "Your list sorted by description: "
my_list.sort_by_item_name

# Feature 3: calculate lapsed time for an item
puts "This item has been outstanding for: "
my_list.items[0].item_time_report
