class Room

def initialize(name, songlist, guestlist, till_count)
  @name = name
  @songlist = songlist
  @guestlist = guestlist
  @till_count = till_count
end

def song_count
@songlist.length

end
def guest_count
  @guestlist.length
end
def add_guest_to_room(guest)
  if @guestlist.length < 2
  @guestlist.push(guest)
else
  p "Sorry, room full"
end
end
def remove_guest(guest)
  @guestlist.delete(guest)
end
def add_song(song)
  @songlist.push(song)
end
def remove_song(song)
  @songlist.delete(song)

end
def charge_guest(guest, room_charge)
  guest.wallet -= room_charge
  # @room1.till_count += room_charge
end
end
