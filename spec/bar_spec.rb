require('minitest/autorun')
require_relative('../bar')

class TestBar < MiniTest::Test

  def setup
    bar_drinks={coke: 10, beer: 5, vodka: 30}
    @bar1=Bar.new(bar_drinks)
  end

  def test_get_coke_price
    coke_price=@bar1.bar_items[:coke]
    assert_equal(10,coke_price)
  end

end

