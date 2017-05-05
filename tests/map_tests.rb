#DELETE THIS FILE - renamed test_map.rb and more code added 
#everything copy/pasted from ex47

require "../lib/game/map.rb"
# require "ex47/game.rb"
# require "./lib/ex47.rb"
require "test/unit"

class TestGame < Test::Unit::TestCase

  def test_room()
    gold = Room.new("GoldRoom", "This room has gold. There's a door to the north.")
    assert_equal("GoldRoom", gold.name)
    assert_equal({}, gold.paths)
  end

  def test_room_paths()
    center = Room.new("Center", "Test room in center.")
    north = Room.new("North", "Test room in north.")
    south= Room.new("South", "Test room in south.")

    center.add_paths({'north'=> north, 'south' => south})
    assert_equal(north, center.go('north'))
    assert_equal(south, center.go('south'))
  end

  def test_map()
    start = Room.new("Start", "You can go west and down a hole.")
    west = Room.new("Trees", "There are trees here, you can go east.")
    down = Room.new("Dungeon", "It's dark  down here, you can go up.")

    start.add_paths({'west' => west, 'down' => down})
    west.add_paths({'east' => start})
    down.add_paths({'up' => start})

    assert_equal(west, start.go('west'))
    assert_equal(start, start.go('west').go('east'))
    assert_equal(start, start.go('down').go('up'))
  end



end #of class
