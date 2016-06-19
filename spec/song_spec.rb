require('minitest/autorun')
require_relative('../song')

class TestSong < MiniTest::Test

  def setup
    @song1=Song.new("Coccodrille Rock","Elton John","Don't Shoot Me I'm Only the Piano Player","Pop")
  end

  def test_song_name
    assert_equal("Coccodrille Rock",@song1.name)
  end

  def test_song_author
    assert_equal("Elton John",@song1.author)
  end

  def test_song_album
    assert_equal("Don't Shoot Me I'm Only the Piano Player",@song1.album)
  end

  def test_genre
    assert_equal("Pop",@song1.genre)
  end
end
