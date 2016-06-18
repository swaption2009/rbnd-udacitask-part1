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
end

class Item
  attr_accessor :description, :completed_status

  def initialize(description)
    @description = description
    @completed_status = false
  end
end