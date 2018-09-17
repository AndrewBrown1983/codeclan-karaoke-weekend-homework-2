require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../song')
require_relative('../room')

class RoomTest < Minitest::Test

  def setup
    @songlist = []
    @guestlist = []
    @room1 = Room.new("Blue", @songlist, @guestlist, 1000)
    @song1 = Song.new("Live Forever", "Oasis")
    @song2 = Song.new("Maggie May", "Rod Stewart")
    @song3 = Song.new("Stand By Me", "Ben E King")
    @song4 = Song.new("Lola", "Ray Davies")
    @guest1 = Guest.new("Bob", 200, @song1)
    @guest2 = Guest.new("Sarah", 10, @song4)
    @guest3 = Guest.new("James", 40, @song4)
  end
  def test_check_songlist
    assert_equal(0, @room1.song_count)
  end
  def test_check_guestlist
    assert_equal(0, @room1.guest_count)
  end
  def test_add_guest_to_room
    @room1.add_guest_to_room(@guest3)

    assert_equal(1, @room1.guest_count)

  end
  def test_remove_guest_from_room
    @room1.add_guest_to_room(@guest1)
    @room1.add_guest_to_room(@guest2)
    @room1.remove_guest(@guest1)

    assert_equal(1, @room1.guest_count)
  end
  def test_add_song_to_songlist
    @room1.add_song(@song4)
    assert_equal(1, @room1.song_count)
  end
  def test_remove_song
    @room1.add_song(@song1)
    @room1.add_song(@song2)
    @room1.remove_song(@song1)
    assert_equal(1, @room1.song_count)
  end

  def test_add_guest_room_full
    @room1.add_guest_to_room(@guest1)
    @room1.add_guest_to_room(@guest2)
    @room1.add_guest_to_room(@guest3)
    assert_equal("Sorry, room full", @room1.add_guest_to_room(@guest3))
  end
  def test_deduct_room_charge_from_guest
    @room1.charge_guest(@guest1, 10)
    assert_equal(190, @guest1.wallet)
    # assert_equal(1010, @room1.till_count)
  end
end
