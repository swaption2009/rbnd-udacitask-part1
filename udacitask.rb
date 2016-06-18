require_relative 'todolist.rb'

# DRY print the list
def print_list(list)
  puts list.title
  list.items.each { |item| puts item.description, item.completed_status ? "Status: Done" : "Status: Not Done" }
  puts "_" * 40
end

# Creates a new todo list
my_list = ToDoList.new("My Ruby ToDo List")

# Add four new items
my_list.add_item("Complete Roobiedocks Adventure")
my_list.add_item("Complete ToyCity Report Generator 1")
my_list.add_item("Complete ToyCity Report Generator 2")
my_list.add_item("Complete Udacitask 1")

# Print the list
print_list(my_list)

# Delete the first item
my_list.items.delete_at(0)

# Print the list
print_list(my_list)

# Delete the second item
my_list.items.delete_at(0)

# Print the list
print_list(my_list)

# Update the completion status of the first item to complete
my_list.items[0].completed_status = true

# Print the list
print_list(my_list)

# Update the title of the list
my_list.title = "My New and Shiny Title"

# Print the list
print_list(my_list)