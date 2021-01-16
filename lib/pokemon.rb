class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []
  
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end
  
  def self.save(name, type, db_connection)

    db_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
    
  def self.find (id, db_connection)
    poke_id = db_connection.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten # flatten method was used because my result was coming out with two brackets like this: [["pokemon"]]
    
    poke_name = poke_id[1]   # assign name
    poke_type = poke_id[2]   # assign type 
    
    new_poke = Pokemon.new(id: id, name: poke_name, type: poke_type, db: db_connection) # create new instance of pokemon
  end
end
