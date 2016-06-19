require('minitest/autorun')
require_relative('../room')
require_relative('../guest')
require_relative('../song')
require_relative('../bar')

class TestRoom < MiniTest::Test

  def setup
    @song1=Song.new("Coccodrille Rock","Elton John","Don't Shoot Me I'm Only the Piano Player","Pop")
    @song2=Song.new("Sweet child o' mine","Guns and Roses","Appetite for ditruction","Rock")
    @song3=Song.new("We are the champions","Queen","News of the World","Pop")
    @song4=Song.new("Wanderwall","Oasis","(What's the Story) Morning Glory?","Rock")
    @song5=Song.new("La Flaca","Jarabe de Palo","La Flaca","Pop")

    @guest1=Guest.new("Davide","de Lerma",123456,11111111,20,@song3)
    @guest2=Guest.new("Jay","Jay Foster",234567,22222222,10,@song2)
    
    playlist=[@song1,@song2,@song3]
    @playlist1=[@song4,@song5]

    bar_drinks={coke: 10, beer: 5, vodka: 30}
    bar1=Bar.new(bar_drinks)

    bar_drinksVIP={prosecco: 30, champagne: 100}

    barVIP=Bar.new(bar_drinksVIP)

    @room1=Room.new(playlist,15,5,bar1)
    @room2=Room.new(playlist,1,8,barVIP)

  end

  def test_count_nb_of_songs_in_playlist
    assert_equal(3,@room1.playlist.length)
  end

  def test_guest_list_is_empty_if_nobody_check_in
    assert_equal(0,@room1.count_guests)
  end

  def test_if_guest_is_added_to_guest_list_after_check_in
    @room1.check_in(@guest1)
    assert_equal(1,@room1.count_guests)
    assert_equal(["Davide"],@room1.show_name)
  end

  def test_if_fee_is_subtracted_from_balance
    @room1.check_in(@guest1)
    assert_equal(15,@guest1.balance)
  end

  def test_checkin_checkout
    @room1.check_in(@guest1)
    assert_equal(1,@room1.count_guests)
    @room1.check_out(@guest1)
    assert_equal(0,@room1.count_guests)
  end

  def test_cant_checkout_because_not_in_guestlist
    @room1.check_in(@guest1)    
    assert_equal("the guest is not in the room",@room1.check_out(@guest2))
  end

  def test_cant_checkin_because_fully_booked
    @room2.check_in(@guest1)
    fully_booked=@room2.check_in(@guest2)
    assert_equal("room fully booked",fully_booked)
  end

  def test_if_guest_already_in_check_list
    @room1.check_in(@guest1)        
    assert_equal(true,@room1.is_in_guestlist?(@guest1))
  end
  
  def test_cant_checkin_beacuse_already_in_guest_list
    @room1.check_in(@guest1)   
    assert_equal("is already in check list",@room1.check_in(@guest1))
  end

  def test_add_song_to_playlist
    @room1.add_songs(@playlist1) 
    assert_equal(5,@room1.playlist.length)
  end

  def test_room_can_get_coke_from_bar
    assert_equal(10,@room1.bar.bar_items[:coke])
  end

  def test_guest_can_buy_from_bar
    @room1.check_in(@guest1)
    @room1.buy_from_bar([:coke],@guest1)
    assert_equal(5,@guest1.balance)
  end

  def test_item_bought_from_bar_is_added_to_guest_bought_items_list
    @room1.check_in(@guest1)
    @room1.buy_from_bar([:coke],@guest1)
    assert_equal([:coke],@guest1.bought_items)
  end

  def test_guest_does_not_have_enough_money_to_buy_from_bar
    @room1.check_in(@guest1)
    test = @room1.buy_from_bar([:coke, :vodka],@guest1)
    assert_equal("don't have enough money",test)
  end

  def test_item_is_not_in_the_bar
    items = [:coke, :wisky]
    newlist = @room1.items_to_buy_are_in_bar?(items)
    assert_equal([:coke],newlist)
  end

  def test_guest_favourite_song_is_in_playlist
    cheer=@room1.include_fav_song?(@guest2)
    assert_equal("lucky man",cheer)
  end
end



