require "mysql2"

class SpaceShipCreate

  # DB CREATE
  ############################################################################

  # create db
  def create_db
    client = self.connect_without_db
    results = client.query("CREATE DATABASE space_ship")
    client.close
    puts "space ship db created"
    
    return true
  end
  
  # create tables in db
  # assumes you connected with the correct db.
  # in this case school..
  def create_tables
    client = self.connect
    
    # create db strings
    
    # class descriptions. english. matth. etc...
    db_str_fleet = "CREATE TABLE fleet (" +
                        "id INT NOT NULL AUTO_INCREMENT, " +
                        "name VARCHAR(255), " +
                        "description VARCHAR(255), " +
                        "PRIMARY KEY (id)" +
                      ");"
    
    client.query(db_str_fleet)
    client.close
    
    puts "space ship fleet table created"
    
    
    return true
  end



  # DB CREDENTIALS
  ############################################################################
  
  # connection credentials.
  def connect
    client = Mysql2::Client.new(:host => "localhost", 
                                :database => "space_ship",
                                :username => "root", 
                                :password => "password")
  end  

  def connect_without_db
    client = Mysql2::Client.new(:host => "localhost", 
                                :username => "root", 
                                :password => "password")
  end
  
end