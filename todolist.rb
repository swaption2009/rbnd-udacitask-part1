class ToDoList
  attr_accessor :title
  attr_reader :items

  def initialize(list_title)
    @title = list_title
    @items = Array.new
  end

  def add_item(new_item)
    item = Item.new(new_item)
    @items.push(item)
  end

  # Feature 1
  def rename_list(name)
    @title = name
  end
end

class Item
  attr_accessor :description, :completed_status

  def initialize(description)
    @description = description
    @completed_status = false
  end

  # Feature 2
  def completed?
    @completed_status
  end

  # Feature 3
  def change_status!
    @completed_status = !@completed_status
  end
end