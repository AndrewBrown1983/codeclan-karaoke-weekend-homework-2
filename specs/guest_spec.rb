require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../song')

class GuestTest < Minitest::Test

  def setup
    @guest1 = Guest.new("Andrew", 100, @song1)
    @song1 = Song.new("Hey Jude", "The Beatles")
  end

  def test_guest_name
    assert_equal("Andrew", @guest1.name)
  end
  def test_wallet_contents
    assert_equal(100, @guest1.wallet)
  end
  def test_fav_song
    assert_equal("Hey Jude", @song1.name)
  end
end
