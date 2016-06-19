class Guest

  attr_reader :name, :sort_code, :account_number, :favourite_song 
  attr_accessor :balance, :bought_items

  def initialize(name,last_name,sort_code,account_number,balance,favourite_song)
    @name = name
    @last_name = last_name
    @balance = balance
    @sort_code = sort_code
    @account_number = account_number
    @favourite_song=favourite_song
    @bought_items=[]
  end

end
