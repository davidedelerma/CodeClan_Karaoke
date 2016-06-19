require "pry-byebug"
class Room

  attr_reader :playlist, :maxcap, :guest, :bar

  def initialize(playlist,maxcap,fee,bar)
    @playlist=playlist
    @maxcap=maxcap
    @guest_list=[]
    @fee=fee
    @bar=bar
  end

  def count_guests
    @guest_list.length
  end

  def show_name #use map function
    guest_names_array=@guest_list.map{|guest| guest.name}
  end

  def is_in_guestlist?(guest)
    #binding.pry
    return true if (@guest_list.include? guest) 
    #binding.pry
  end

  def is_fully_booked?(guest)
    return true if (count_guests >= @maxcap)
  end

  def has_money_to_pay_fee?(guest)
    return true if (guest.balance >= @fee)
  end

  def check_in(guest) #Check in
    return "is already in check list" if is_in_guestlist?(guest)
    return "room fully booked" if is_fully_booked?(guest)
    return "No money to book the room" if !has_money_to_pay_fee?(guest)
      @guest_list << guest 
      guest.balance -= @fee   
  end

  def check_out(guest)
    return "the guest is not in the room" if !is_in_guestlist?(guest)
    @guest_list.delete(guest)
  end
  
  def add_songs(songs)
    @playlist+=songs
  end

  # def items_to_buy_are_in_bar?(items)
  #   for item in items
  #     if ! @bar.keys.include?(item)
  #       items.delete(item)
  #     end
  #   end
  # end

  def buy_from_bar(items,guest)
#still to add option when item is not in the list
    return "guest not in guest list" if ! is_in_guestlist?(guest)
    # array of prices from array of items  
    prices = []    
    for item in items
      prices << @bar.bar_items[item]
    end
    #find the total amount of money spent
    tot_price = 0
    for price in prices
      tot_price += price
    end
    #check if guest has enough money to buy items from bar
    return "don't have enough money" if tot_price > guest.balance
    #take money spent from guest's balance and add items to the list of bouth items
    guest.bought_items+=items
    guest.balance-=tot_price
  end

  def include_fav_song?(guest)
    favsong=guest.favourite_song
    if (@playlist.include?(favsong))
      return "lucky man" 
    end
  end 


end