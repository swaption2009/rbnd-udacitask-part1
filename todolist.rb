class ToDoList
  attr_accessor :title
  attr_reader :items

  def initialize(list_title)
    @title = list_title
    @items = Array.new
  end

  def add_item
    puts "How many to-do items do you have?"
    number_of_items = gets.chomp.to_i
    number_of_items.times do |item|
      puts "Enter your to-do item: "
      to_do_item = gets.chomp.to_s
      item = Item.new(to_do_item)
      @items.push(item)
    end
  end

  def delete_item
    puts "Which item number do you like to delete? (enter a task_id number): " if @items.count > 1
    del_item = gets.chomp.to_i
    @items.delete_at(del_item-1)
  end

  def change_status!
    puts "Which item number have you completed? " if @items.count > 1
    completed_item = gets.chomp.to_i
    @items[completed_item-1].completed_status = true
    puts "Congratulations! " + @items[completed_item].description + " is completed"
  end

  def rename_list
    puts "Enter new name of the list: " if @items.count > 1
    name = gets.chomp.to_s
    @title = name
  end

  def print_list
    puts "*" * 30
    puts @title
    puts "*" * 30
    @items.each { |item| puts item.description, item.completed_status ? "Status: Done" : "Status: Not Done" }
end

  # Feature 1
  def progress_report
    total_items = @items.count
    completed_items = @items.select { |item| item.completed_status == true }.count
    puts "You've completed " + completed_items.to_s + " out of " + total_items.to_s + " tasks you have."
  end

  # Feature 2
  def sort_by_item_name
    sorted_list = @items.sort_by! { |item| item.description }
    sorted_list.each { |item| puts item.description }
  end
end

class Item
  attr_accessor :description, :completed_status, :created_at

  def initialize(description)
    @description = description
    @completed_status = false
    @created_at = Time.now
  end

  def completed?
    @completed_status
  end

  # Feature 3
  def item_time_report
    lapse_time = Time.now - @created_at
    puts lapse_time
  end
end