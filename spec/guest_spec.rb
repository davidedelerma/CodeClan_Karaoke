require('minitest/autorun')
require_relative('../guest')
require_relative('../song')

class TestGuest < MiniTest::Test

  def setup
    song1=Song.new("Coccodrille Rock","Elton John","Don't Shoot Me I'm Only the Piano Player","Pop")
    @guest1=Guest.new("Davide","de Lerma",123456,11111111,10,song1)
  end

  def test_guest_input_name
    assert_equal("Davide",@guest1.name)
  end

end