#use hash to make a bar
#the bar is colled form room
class Bar
  attr_reader :bar_items

  def initialize(bar_items)
    @bar_items=bar_items
  end
end