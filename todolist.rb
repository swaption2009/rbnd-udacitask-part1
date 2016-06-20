class ToDoList
  attr_accessor :title
  attr_reader :items

  def initialize(list_title)
    @title = list_title
    @items = Array.new
  end

  def add_item(item)
    item = Item.new(item)
    @items << item
  end

  def delete_item
    puts "Which item number do you like to delete? (enter a task_id number): "
    del_item = gets.chomp.to_i
    if del_item > @items.count
      puts "invalid entry"
    else
      @items.delete_at(del_item-1)
    end
  end

  def change_status!
    puts "Which item number have you completed? " if @items.count > 1
    completed_item = gets.chomp.to_i
    @items[completed_item-1].completed_status = true
    puts "Congratulations! " + @items[completed_item].description + " is completed"
  end

  def print_list
    puts "*" * 30
    puts @title
    puts "*" * 30
    @items.each do |item|
      item.print_item(item)
    end
  end

  # Feature 1
  def progress_report
    total_items = @items.count
    completed_items = @items.select { |item| item.completed_status == true }.count
    puts "You've completed " + completed_items.to_s + " out of " + total_items.to_s + " tasks you have."
  end

  # Feature 2
  def sort_by_item_name
    sorted_list = @items.sort! { |x,y| x.to_s <=> y.to_s }
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

  def print_item(item)
    puts item.description, item.completed_status ? "Status: Done" : "Status: Not Done"
  end

  # Feature 3
  def item_time_report
    lapse_time = Time.now - @created_at
    puts lapse_time
  end
end