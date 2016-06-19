class Viewer

  def get_guest_name
    puts "Insert guest name: "
        return gets.chomp
  end

  def get_guest_last_name
    puts "Insert guest last name: "
        return gets.chomp
  end

  def get_guest_sort_code
    puts "Insert guest sort code: "
        return gets.chomp
  end

  def get_guest_account_number
    puts "Insert guest account number: "
        return gets.chomp
  end

  def get_guest_balance
    puts "Insert guest account balance: "
        return gets.chomp
  end

  def select_an_option
      puts "WELCOME TO KODEKLAN KARAOKE"
      puts "Please type an option"
      puts "CI to check in"
      puts "CO to check out"
      puts "BUY to buy from bar"
      puts "exit"
      return option = gets.chomp
  end

  def insert_array_of_items_to_buy
     puts "Insert an array of items form the list: coke: £10, beer: £5, vodka: £30. Insert the list as an array of symbols"
     return items=gets.chomp
  end
end