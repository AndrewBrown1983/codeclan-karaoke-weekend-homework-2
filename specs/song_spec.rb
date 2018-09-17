require('minitest/autorun')
require('minitest/rg')
require_relative('../song')

class SongTest < Minitest::Test

  def setup

@song = Song.new("Angie", "The Rolling Stones")

  end

  def test_song_name
    assert_equal("Angie", @song.name)
  end

  def test_song_artist
    assert_equal("The Rolling Stones", @song.artist)

  end
end
