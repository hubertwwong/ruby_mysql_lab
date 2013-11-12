require "mysql2"

class SchoolCreate

  # DB CREATE
  ############################################################################

  # create db
  def create_db
    client = self.connect_without_db
    results = client.query("CREATE DATABASE school")
    return true
  end
  
  # create tables in db
  # assumes you connected with the correct db.
  # in this case school..
  def create_tables
    client = self.connect
    
    # create db strings
    
    # class descriptions. english. matth. etc...
    db_str_subject = "CREATE TABLE subject (" +
                     "id INT NOT NULL AUTO_INCREMENT, " +
                     "name VARCHAR(255), " +
                     "PRIMARY KEY (id)" +
                   ");"
                   
    # a list of people for school.
    db_str_person = "CREATE TABLE person (" +
                      "id INT NOT NULL AUTO_INCREMENT, " +
                      "first_name VARCHAR(255), " +
                      "last_name VARCHAR(255), " +
                      "role_id INT, " +
                      "gender VARCHAR(255), " +
                      "PRIMARY KEY (id)" +
                     ");"
    # role id... student or teacher.
    db_str_role = "CREATE TABLE role (" +
                    "id INT NOT NULL AUTO_INCREMENT, " +
                    "name VARCHAR(255), " +
                    "PRIMARY KEY (id)" +
                  ");"
    
    # schedule of classes avaiable.
    # status might be something like open close, wait etc...
    db_str_schedule = "CREATE TABLE schedule (" +
                        "id INT NOT NULL AUTO_INCREMENT, " +
                        "subject_id INT, " +
                        "person_id INT, " +
                        "name VARCHAR(255), " +
                        "num_seat INT, " +
                        "num_wait_seat INT, " +
                        "status VARCHAR(255), " +
                        "PRIMARY KEY (id)" +
                      ");"
    
    # describe what a period is.
    # stuff like period 1 might run from 1:00pm to 2:00p on MWF
    # probably am just going to ignore the date part
    # and just use time.
    db_str_period = "CREATE TABLE period (" +
                      "id INT NOT NULL AUTO_INCREMENT, " +
                      "mon_start DATETIME, " +
                      "mon_end DATETIME, " +
                      "tue_start DATETIME, " +
                      "tue_end DATETIME, " +
                      "wed_start DATETIME, " +
                      "wed_end DATETIME, " +
                      "thu_start DATETIME, " +
                      "thu_end DATETIME, " +
                      "fri_start DATETIME, " +
                      "fri_end DATETIME, " +
                      "sat_start DATETIME, " +
                      "sat_end DATETIME, " +
                      "sun_start DATETIME, " +
                      "sun_end DATETIME, " +
                      "PRIMARY KEY (id)" +
                    ");"
    
    # student schedules.
    db_str_student_schedule = "CREATE TABLE student_schedule (" +
                                "id INT NOT NULL AUTO_INCREMENT, " +
                                "schedule_id INT, " +
                                "person_id INT, " +
                                "PRIMARY KEY (id)" +
                              ");"
                  
                  
    results = client.query(db_str_subject)
    results = client.query(db_str_person)
    results = client.query(db_str_role)
    results = client.query(db_str_schedule)
    results = client.query(db_str_period)
    results = client.query(db_str_student_schedule)
    
    return true
  end



  # DB CREDENTIALS
  ############################################################################
  
  # connection credentials.
  def connect
    client = Mysql2::Client.new(:host => "localhost", 
                                :database => "school",
                                :username => "root", 
                                :password => "password")
  end  

  def connect_without_db
    client = Mysql2::Client.new(:host => "localhost", 
                                :username => "root", 
                                :password => "password")
  end
  
end