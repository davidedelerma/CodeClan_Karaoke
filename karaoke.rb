require "pry-byebug"

require_relative("bar")
require_relative("guest")
require_relative("room")
require_relative("song")
require_relative("viewer")


class Karaoke

  def initialize(viewer)

    @viewer = viewer

    guest_name = @viewer.get_guest_name
    guest_last_name = @viewer.get_guest_last_name
    guest_sort_code = @viewer.get_guest_sort_code.to_i
    guest_account_numbert = @viewer.get_guest_account_number.to_i
    guest_balance=@viewer.get_guest_balance.to_i

   @song1=Song.new("Coccodrille Rock","Elton John","Don't Shoot Me I'm Only the Piano Player","Pop")

    @guest = Guest.new(guest_name,guest_last_name,guest_sort_code,guest_account_numbert,guest_balance,@song1) #add favourite song 
    
    @song2=Song.new("Sweet child o' mine","Guns and Roses","Appetite for ditruction","Rock")
    @song3=Song.new("We are the champions","Queen","News of the World","Pop")

    playlist=[@song1,@song2,@song3]

    bar_drinks={coke: 10, beer: 5, vodka: 30}
    bar1=Bar.new(bar_drinks)

    @room1=Room.new(playlist,15,5,bar1)

  end
#import actions from viewer: check in, check out, buy from bar, check favourite song and exit do a while loop until the action is exit
  def run()
    option = @viewer.select_an_option
    #binding.pry
    while option != "exit"
      #binding.pry
      case option
      when "CI"
        @room1.check_in(@guest)
      when "CO"
        @room1.check_out(@guest)
      when "BUY"
        items=@viewer.insert_array_of_items_to_buy
        @room1.buy_from_bar(items,@guest)
      end
      option = @viewer.select_an_option
    end
  end 

end


karaoke = Karaoke.new(Viewer.new)
karaoke.run()