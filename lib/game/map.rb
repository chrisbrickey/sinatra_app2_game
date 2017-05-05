#!!!I created the map.rb file from scratch. It might need to be renamed as game.rb (a file that was already in this directory) to make links work




module Map

  class Room  #class Room is a copy/paste from ex47

    def initialize(name, description)
      @name = name
      @description = description
      @paths = {}
    end

    #making it easy to access the variables...
    attr_reader :name
    attr_reader :description
    attr_reader :paths

    def go(direction)
      return @paths[direction]
    end

    def add_paths(paths)
      @paths.update(paths)
    end

  end#of Room class

  #everything below is a copy/paste of sinatra_original
  #CREATING NEW ROOMS
  #see initialize method...every room has 2 params: name, description
  CENTRAL_CORRIDOR = Room.new("Central Corridor",
  """
  The Aliens have invaded...
  ..........
  It's blocking the door to the armory and about to pull a weapon on you.
  """)

  LASER_WEAPON_ARMORY = Room.new("Laser Weapon Armory",
  """
  You're in the armory.
  You see the neutron bomb in its container with a lock.
  If you get the code wrong 10 times, the lock closes forever.
  The code is 2 digits.
  """)

  THE_BRIDGE = Room.new("The Bridge",
  """
  You burst onto the bridge with the bomb.
  The aliens trying to take over the ship see you.
  They see the bomb so haven't yet pulled their weapons on you.
  """)

  ESCAPE_POD = Room.new('Escape pod',
  """
  You get to the chamber with escape pods.
  Some may be damaged, but you only have time to choose one.
  Which one do you take (1 or 2)?
  """) #in the original, you choose among 5 pods

  THE_END_WINNER = Room.new("The End", "You escape and the ship explodes. You win!!")

  THE_END_LOSER = Room.new("The End", "The pod is faulty and implodes. You lose.")


  #DOING STUFF WITH THE ROOMS (connecting them using the add_paths method)
  ESCAPE_POD.add_paths({
    '2' => THE_END_WINNER,
    #* is a 'catch all' action in the engine
    '*' => THE_END_LOSER
    })

  #need to manually add this to end of all bad decisions made in game (before reaching the end)
  GENERIC_DEATH = Room.new("death", "You died.")

  THE_BRIDGE.add_paths({
    'throw the bomb' => GENERIC_DEATH,
    'slowly place the bomb' => ESCAPE_POD
    })

  LASER_WEAPON_ARMORY.add_paths({
    '0123' => THE_BRIDGE,
    '*' => GENERIC_DEATH
    })

  CENTRAL_CORRIDOR.add_paths({
    'shoot!' => GENERIC_DEATH,
    'dodge!' => GENERIC_DEATH,
    'tell a joke' => LASER_WEAPON_ARMORY
    })

  START = CENTRAL_CORRIDOR

#WHITELIST OF ALLOWED ROOM NAMES SO OTHER PPL ON INTERNET CAN'T ACCESS RANDOM VARIABLES WITH NAMES
  ROOM_NAMES = {
    'CENTRAL_CORRIDOR' => CENTRAL_CORRIDOR,
    'LASER_WEAPON_ARMORY' => LASER_WEAPON_ARMORY,
    'THE_BRIDGE' => THE_BRIDGE,
    'ESCAPE_POD' => ESCAPE_POD,
    'THE_END_WINNER' => THE_END_WINNER,
    'THE_END_LOSER' => THE_END_LOSER,
    'START' => START
  }


  def Map::load_room(session)
    #given a session this will return the right room or nil
    return ROOM_NAMES[session[:room]]
  end

  def Map::save_room(session, room)
    #store the room in the session for later, using its name
    session[:room] = ROOM_NAMES.key(room)
  end

end #of module
